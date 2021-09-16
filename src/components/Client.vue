<template>
  <div>

    <el-table :data="getClients()" :span-method="objectSpanMethod" border
              style="width: 100%">
      <el-table-column prop="name" label="Name">

      </el-table-column>
      <el-table-column prop="region" label="Region">

      </el-table-column>
      <el-table-column prop="iface" label="Iface">

      </el-table-column>
      <el-table-column prop="ip" label="IP">

      </el-table-column>
      <el-table-column prop="timestamp" label="Timestamp">

      </el-table-column>
    </el-table>
  </div>
</template>

<script>
  export default {
    name: 'Client',
    data() {
      return {
        clientsList: [
          {
            name: "c1",
            region: "work",
            iface: "eth0",
            ip: "192.168.4.5"
          }
        ],
        data:{}
        // spans: [{colspan: 0, row: 0}]
      }
    },
    mounted() {
    },
    computed:{
    },
    methods: {

      objectSpanMethod({rowIndex, columnIndex}) {
        let _this=this
        var rows = []
        var cols = []
        for(let i =0 ;i<_this.spans.length;i++){
          rows.push(_this.spans[i].row)
          cols.push(_this.spans[i].colspan)
        }
        if (columnIndex === 0 || columnIndex === 1 || columnIndex ===4) {
            if (rows.indexOf(rowIndex) !== -1) {
              return {
                rowspan: cols[rows.indexOf(rowIndex)],
                colspan: 1
              }
            } else {
              return {
                rowspan: 0,
                colspan: 0
              };
          }
        }
      },
      getClients() {
        let _this = this
        var lists = []
        this.axios.get('/clients')
          .then(function (response) {
            _this.data = response.data.data
            if (response.data.code === 0) {
              _this.spans = []
              var rowAt = 0
              for (let key in response.data.data) {
                for (let i = 0; i < response.data.data[key].data.length; i++) {
                  lists.push({
                    "name": response.data.data[key].name,
                    "region": response.data.data[key].region,
                    "iface": response.data.data[key].data[i].iface_name,
                    "ip": response.data.data[key].data[i].ip_addr,
                    "timestamp": new Date(response.data.data[key].timestamp*1000).toLocaleString().replace(/:\d{1,2}$/,' ')
                  })
                }
                _this.spans.push({row:rowAt,colspan:response.data.data[key].data.length})
                rowAt += response.data.data[key].data.length
              }
            }
          })
          .catch(function (error) {
            console.log(error);
          })
          .then(function () {
            // always executed
          })
        return lists
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  h3 {
    margin: 40px 0 0;
  }

  ul {
    list-style-type: none;
    padding: 0;
  }

  li {
    display: inline-block;
    margin: 0 10px;
  }

  a {
    color: #42b983;
  }
</style>
