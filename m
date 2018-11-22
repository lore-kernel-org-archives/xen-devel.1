From: Olaf Hering <olaf@aepfle.de>
Subject: qemu assert in staging during HVM live migration
Date: Thu, 22 Nov 2018 11:03:45 +0100
Message-ID: <20181122100344.GA13748@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2029909873618459653=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=aics=ob=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gPlpy-0004Go-JL
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 10:03:55 +0000
Received: from aepfle.de by smtp.strato.de (RZmta 44.4 AUTH)
 with ESMTPSA id z0117auAMA3mWWk
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Thu, 22 Nov 2018 11:03:48 +0100 (CET)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============2029909873618459653==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline


--E/DnYTRukya0zdZ1
Content-Type: multipart/mixed; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

While debugging something else, it turned out that staging and/or qemu
can not migrate HVM domUs. qemu runs into an assert when the domU is
about to be migrated with 'xl migrate domU dom0':

qemu-system-i386: block/block-backend.c:903: blk_get_attached_dev_id: Assertion `!blk->legacy_dev' failed.

Using /usr/bin/qemu-system-i386 from qemu-3.1 failed as well.
The workaround was to enforce my own qemu-2.12.

Since I have very very little runtime available on that system, thats
all the info I could collect.
Any idea what might be wrong? That 'legacy' code is in qemu since a few
years already, according to 'git blame'.

Olaf

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="domU.cfg"

name = "domUname"
uuid = "3fae4e2e-dcf6-11e8-b1da-76a50c452436"
maxmem = 32768
memory = 32768
vcpus = 16
pae = 1
acpi = 1
apic = 1
viridian = 0
rtc_timeoffset = 0
localtime = 0
on_poweroff = "destroy"
on_reboot = "restart"
on_crash = "destroy"
#device_model_override = "/usr/lib64/qemu-2.12/bin/qemu-system-i386"
sdl = 0
vnc = 1
vncunused = 1
keymap = "en-us"
vif = [ "mac=00:16:3e:79:78:20,bridge=br0,script=vif-bridge,type=vif,vifname=v20", "mac=00:16:3e:79:78:15,bridge=br0,script=vif-bridge,type=vif,vifname=v15" ]
parallel = "none"
serial = "pty"
builder = "hvm"
boot = "c"
disk = [ "format=raw,vdev=xvda,access=rw,backendtype=qdisk,target=/path/v83-xvda", "format=raw,vdev=xvdb,access=rw,backendtype=qdisk,target=/path/v86-xvdb", "format=raw,vdev=xvdc,access=rw,backendtype=qdisk,target=/path/v87-xvdc", "format=raw,vdev=xvdd,access=rw,backendtype=qdisk,target=/path/v88-xvdd", "format=raw,vdev=xvde,access=rw,backendtype=qdisk,target=/path/v90-xvde", "format=raw,vdev=xvdy,access=ro,backendtype=qdisk,target=/dev/shm/vhostmd0", "format=raw,vdev=xvdz,access=rw,backendtype=qdisk,target=/path/v91-xvdz" ]



--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xl-create.txt"
Content-Transfer-Encoding: quoted-printable

Parsing config from domU.cfg
{
    "c_info": {
        "type": "hvm",
        "name": "domUname",
        "uuid": "3fae4e2e-dcf6-11e8-b1da-76a50c452436",
        "run_hotplug_scripts": "True"
    },
    "b_info": {
        "max_vcpus": 16,
        "avail_vcpus": [
            0,
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15
        ],
        "max_memkb": 33554432,
        "target_memkb": 33554432,
        "shadow_memkb": 278528,
        "localtime": "False",
        "sched_params": {

        },
        "claim_mode": "True",
        "acpi": "True",
        "apic": "True",
        "type.hvm": {
            "pae": "True",
            "viridian": "False",
            "vga": {

            },
            "vnc": {
                "enable": "True",
                "findunused": "True"
            },
            "keymap": "en-us",
            "sdl": {
                "enable": "False"
            },
            "spice": {

            },
            "serial": "pty",
            "boot": "c",
            "rdm": {

            }
        },
        "arch_arm": {

        }
    },
    "disks": [
        {
            "pdev_path": "/path/v83-xvda",
            "vdev": "xvda",
            "backend": "qdisk",
            "format": "raw",
            "readwrite": 1
        },
        {
            "pdev_path": "/path/v86-xvdb",
            "vdev": "xvdb",
            "backend": "qdisk",
            "format": "raw",
            "readwrite": 1
        },
        {
            "pdev_path": "/path/v87-xvdc",
            "vdev": "xvdc",
            "backend": "qdisk",
            "format": "raw",
            "readwrite": 1
        },
        {
            "pdev_path": "/path/v88-xvdd",
            "vdev": "xvdd",
            "backend": "qdisk",
            "format": "raw",
            "readwrite": 1
        },
        {
            "pdev_path": "/path/v90-xvde",
            "vdev": "xvde",
            "backend": "qdisk",
            "format": "raw",
            "readwrite": 1
        },
        {
            "pdev_path": "/dev/shm/vhostmd0",
            "vdev": "xvdy",
            "backend": "qdisk",
            "format": "raw"
        },
        {
            "pdev_path": "/path/v91-xvdz",
            "vdev": "xvdz",
            "backend": "qdisk",
            "format": "raw",
            "readwrite": 1
        }
    ],
    "nics": [
        {
            "devid": 0,
            "mac": "00:16:3e:79:78:20",
            "bridge": "br0",
            "ifname": "v20",
            "script": "vif-bridge",
            "nictype": "vif"
        },
        {
            "devid": 1,
            "mac": "00:16:3e:79:78:15",
            "bridge": "br0",
            "ifname": "v15",
            "script": "vif-bridge",
            "nictype": "vif"
        }
    ],
    "on_reboot": "restart",
    "on_soft_reset": "soft_reset"
}
libxl: debug: libxl_create.c:1675:do_domain_create: Domain 0:ao 0x20c1220: =
create: how=3D(nil) callback=3D(nil) poller=3D0x20b6300
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvda spec.backend=3Dqdisk
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvdb spec.backend=3Dqdisk
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvdc spec.backend=3Dqdisk
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvdd spec.backend=3Dqdisk
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvde spec.backend=3Dqdisk
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvdy spec.backend=3Dqdisk
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvdz spec.backend=3Dqdisk
libxl: debug: libxl_create.c:999:initiate_domain_create: Domain 7:running b=
ootloader
libxl: debug: libxl_bootloader.c:328:libxl__bootloader_run: Domain 7:not a =
PV/PVH domain, skipping bootloader
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0b9530: deregister unregistered
libxl: debug: libxl_numa.c:502:libxl__get_numa_candidate: New best NUMA pla=
cement candidate found: nr_nodes=3D1, nr_cpus=3D44, nr_vcpus=3D32, free_mem=
kb=3D500073
libxl: debug: libxl_numa.c:502:libxl__get_numa_candidate: New best NUMA pla=
cement candidate found: nr_nodes=3D1, nr_cpus=3D44, nr_vcpus=3D16, free_mem=
kb=3D522751
libxl: debug: libxl_numa.c:502:libxl__get_numa_candidate: New best NUMA pla=
cement candidate found: nr_nodes=3D1, nr_cpus=3D44, nr_vcpus=3D16, free_mem=
kb=3D523261
libxl: detail: libxl_dom.c:235:numa_place_domain: NUMA placement candidate =
with 1 nodes, 44 cpus and 523261 KB free selected
domainbuilder: detail: xc_dom_allocate: cmdline=3D"", features=3D""
domainbuilder: detail: xc_dom_kernel_file: filename=3D"/usr/lib/xen/boot/hv=
mloader"
domainbuilder: detail: xc_dom_malloc_filemap    : 614 kB
libxl: debug: libxl_dom.c:988:libxl__load_hvm_firmware_module: Loading BIOS=
: /usr/lib/xen/boot/seabios.bin
domainbuilder: detail: xc_dom_boot_xen_init: ver 4.12, caps xen-3.0-x86_64 =
xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64=20
domainbuilder: detail: xc_dom_parse_image: called
domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary loader .=
=2E.=20
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ...=20
domainbuilder: detail: loader probe OK
xc: detail: ELF: phdr: paddr=3D0x100000 memsz=3D0x66ca4
xc: detail: ELF: memory: 0x100000 -> 0x166ca4
domainbuilder: detail: xc_dom_mem_init: mem 32760 MB, pages 0x7ff800 pages,=
 4k each
domainbuilder: detail: xc_dom_mem_init: 0x7ff800 pages
domainbuilder: detail: xc_dom_boot_mem_init: called
domainbuilder: detail: range: start=3D0x0 end=3D0xf0000000
domainbuilder: detail: range: start=3D0x100000000 end=3D0x80f800000
domainbuilder: detail: xc_dom_malloc            : 64 MB
xc: detail: PHYSICAL MEMORY ALLOCATION:
xc: detail:   4KB PAGES: 0x0000000000000200
xc: detail:   2MB PAGES: 0x00000000000003fb
xc: detail:   1GB PAGES: 0x000000000000001e
domainbuilder: detail: xc_dom_build_image: called
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x100+=
0x67 at 0x7f8c92cd2000
domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x100000 -> 0=
x167000  (pfn 0x100 + 0x67 pages)
xc: detail: ELF: phdr 0 at 0x7f8c92c6b000 -> 0x7f8c92cc80c8
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x167+=
0x40 at 0x7f8c92c92000
domainbuilder: detail: xc_dom_alloc_segment:   System Firmware module : 0x1=
67000 -> 0x1a7000  (pfn 0x167 + 0x40 pages)
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x1a7+=
0x1 at 0x7f8c92e2d000
domainbuilder: detail: xc_dom_alloc_segment:   HVM start info : 0x1a7000 ->=
 0x1a8000  (pfn 0x1a7 + 0x1 pages)
domainbuilder: detail: alloc_pgtables_hvm: doing nothing
domainbuilder: detail: xc_dom_build_image  : virt_alloc_end : 0x1a8000
domainbuilder: detail: xc_dom_build_image  : virt_pgtab_end : 0x0
domainbuilder: detail: xc_dom_boot_image: called
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x=
86_64
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x=
86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x=
86_32 <=3D matches
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x=
86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x=
86_64
domainbuilder: detail: domain builder memory footprint
domainbuilder: detail:    allocated
domainbuilder: detail:       malloc             : 64 MB
domainbuilder: detail:       anon mmap          : 0 bytes
domainbuilder: detail:    mapped
domainbuilder: detail:       file mmap          : 614 kB
domainbuilder: detail:       domU mmap          : 672 kB
domainbuilder: detail: vcpu_hvm: called
domainbuilder: detail: compat_gnttab_hvm_seed: d7: pfn=3D0x80f800
domainbuilder: detail: xc_dom_set_gnttab_entry: d7 gnt[0] -> d0 0xfefff
domainbuilder: detail: xc_dom_set_gnttab_entry: d7 gnt[1] -> d0 0xfeffc
domainbuilder: detail: xc_dom_release: called
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvda spec.backend=3Dqdisk
libxl: debug: libxl_linux.c:227:libxl__get_hotplug_script_info: Domain 7:ba=
ckend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 7:No hotplug scrip=
t to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0bb880: deregister unregistered
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvdb spec.backend=3Dqdisk
libxl: debug: libxl_linux.c:227:libxl__get_hotplug_script_info: Domain 7:ba=
ckend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 7:No hotplug scrip=
t to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0bc9e0: deregister unregistered
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvdc spec.backend=3Dqdisk
libxl: debug: libxl_linux.c:227:libxl__get_hotplug_script_info: Domain 7:ba=
ckend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 7:No hotplug scrip=
t to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0be0e0: deregister unregistered
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvdd spec.backend=3Dqdisk
libxl: debug: libxl_linux.c:227:libxl__get_hotplug_script_info: Domain 7:ba=
ckend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 7:No hotplug scrip=
t to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0bf180: deregister unregistered
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvde spec.backend=3Dqdisk
libxl: debug: libxl_linux.c:227:libxl__get_hotplug_script_info: Domain 7:ba=
ckend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 7:No hotplug scrip=
t to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0c0220: deregister unregistered
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvdy spec.backend=3Dqdisk
libxl: debug: libxl_linux.c:227:libxl__get_hotplug_script_info: Domain 7:ba=
ckend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 7:No hotplug scrip=
t to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0bccf0: deregister unregistered
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=
=3Dxvdz spec.backend=3Dqdisk
libxl: debug: libxl_linux.c:227:libxl__get_hotplug_script_info: Domain 7:ba=
ckend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 7:No hotplug scrip=
t to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0c32e0: deregister unregistered
libxl: debug: libxl_disk.c:918:libxl__device_disk_find_local_path: Directly=
 accessing local RAW disk /path/v83-xvda
libxl: debug: libxl_disk.c:918:libxl__device_disk_find_local_path: Directly=
 accessing local RAW disk /path/v86-xvdb
libxl: debug: libxl_disk.c:918:libxl__device_disk_find_local_path: Directly=
 accessing local RAW disk /path/v87-xvdc
libxl: debug: libxl_disk.c:918:libxl__device_disk_find_local_path: Directly=
 accessing local RAW disk /path/v88-xvdd
libxl: debug: libxl_disk.c:918:libxl__device_disk_find_local_path: Directly=
 accessing local RAW disk /path/v90-xvde
libxl: debug: libxl_disk.c:918:libxl__device_disk_find_local_path: Directly=
 accessing local RAW disk /dev/shm/vhostmd0
libxl: debug: libxl_disk.c:918:libxl__device_disk_find_local_path: Directly=
 accessing local RAW disk /path/v91-xvdz
libxl: debug: libxl_dm.c:1695:libxl__build_device_model_args_new: Domain 7:=
dm_restrict disabled, starting QEMU as root
libxl: debug: libxl_dm.c:2372:libxl__spawn_local_dm: Domain 7:Spawning devi=
ce-model /usr/lib/xen/bin/qemu-system-i386 with arguments:
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  /usr/lib/xe=
n/bin/qemu-system-i386
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -xen-domid
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  7
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -chardev
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  socket,id=
=3Dlibxl-cmd,path=3D/var/run/xen/qmp-libxl-7,server,nowait
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -no-shutdown
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -mon
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  chardev=3Dl=
ibxl-cmd,mode=3Dcontrol
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -chardev
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  socket,id=
=3Dlibxenstat-cmd,path=3D/var/run/xen/qmp-libxenstat-7,server,nowait
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -mon
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  chardev=3Dl=
ibxenstat-cmd,mode=3Dcontrol
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -nodefaults
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -no-user-co=
nfig
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -name
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  domUname
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -vnc
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  127.0.0.1:0=
,to=3D99
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -display
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  none
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -k
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  en-us
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -serial
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  pty
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -device
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  cirrus-vga,=
vgamem_mb=3D8
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -boot
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  order=3Dc
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -smp
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  16,maxcpus=
=3D16
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -net
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  none
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -machine
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  xenfv
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -m
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  32760
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -drive
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  file=3D/pat=
h/v83-xvda,if=3Dide,index=3D0,media=3Ddisk,format=3Draw,cache=3Dwriteback
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -drive
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  file=3D/pat=
h/v86-xvdb,if=3Dide,index=3D1,media=3Ddisk,format=3Draw,cache=3Dwriteback
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -drive
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  file=3D/pat=
h/v87-xvdc,if=3Dide,index=3D2,media=3Ddisk,format=3Draw,cache=3Dwriteback
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  -drive
libxl: debug: libxl_dm.c:2374:libxl__spawn_local_dm: Domain 7:  file=3D/pat=
h/v88-xvdd,if=3Dide,index=3D3,media=3Ddisk,format=3Draw,cache=3Dwriteback
libxl: debug: libxl_dm.c:2376:libxl__spawn_local_dm: Domain 7:Spawning devi=
ce-model /usr/lib/xen/bin/qemu-system-i386 with additional environment:
libxl: debug: libxl_dm.c:2378:libxl__spawn_local_dm: Domain 7:  XEN_QEMU_CO=
NSOLE_LIMIT=3D1048576
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=3D0x20b=
9828 wpath=3D/local/domain/0/device-model/7/state token=3D3/0: register slo=
tnum=3D3
libxl: debug: libxl_create.c:1712:do_domain_create: Domain 0:ao 0x20c1220: =
inprogress: poller=3D0x20b6300, flags=3Di
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=3D0x20b9828 wpath=
=3D/local/domain/0/device-model/7/state token=3D3/0: event epath=3D/local/d=
omain/0/device-model/7/state
libxl: debug: libxl_exec.c:398:spawn_watch_event: domain 7 device model: sp=
awn watch p=3D(null)
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=3D0x20b9828 wpath=
=3D/local/domain/0/device-model/7/state token=3D3/0: event epath=3D/local/d=
omain/0/device-model/7/state
libxl: debug: libxl_exec.c:398:spawn_watch_event: domain 7 device model: sp=
awn watch p=3Drunning
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=3D0x2=
0b9828 wpath=3D/local/domain/0/device-model/7/state token=3D3/0: deregister=
 slotnum=3D3
libxl: debug: libxl_exec.c:129:libxl_report_child_exitstatus: domain 7 devi=
ce model (dying as expected) [4582] died due to fatal signal Killed
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0b9828: deregister unregistered
libxl: debug: libxl_qmp.c:779:libxl__qmp_initialize: Domain 7:connected to =
/var/run/xen/qmp-libxl-7
libxl: debug: libxl_qmp.c:343:qmp_handle_response: Domain 7:message type: q=
mp
libxl: debug: libxl_qmp.c:358:qmp_handle_response: Domain 7:QEMU version: 3=
=2E0.0
libxl: debug: libxl_qmp.c:628:qmp_send_prepare: Domain 7:next qmp command: =
'{"execute":"qmp_capabilities","id":1}'
libxl: debug: libxl_qmp.c:343:qmp_handle_response: Domain 7:message type: r=
eturn
libxl: debug: libxl_qmp.c:628:qmp_send_prepare: Domain 7:next qmp command: =
'{"execute":"query-chardev","id":2}'
libxl: debug: libxl_qmp.c:343:qmp_handle_response: Domain 7:message type: r=
eturn
libxl: debug: libxl_qmp.c:628:qmp_send_prepare: Domain 7:next qmp command: =
'{"execute":"query-vnc","id":3}'
libxl: debug: libxl_qmp.c:343:qmp_handle_response: Domain 7:message type: r=
eturn
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=3D0x20c=
67f0 wpath=3D/local/domain/0/backend/vif/7/0/state token=3D3/1: register sl=
otnum=3D3
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=3D0x20c=
6f30 wpath=3D/local/domain/0/backend/vif/7/1/state token=3D2/2: register sl=
otnum=3D2
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=3D0x20c67f0 wpath=
=3D/local/domain/0/backend/vif/7/0/state token=3D3/1: event epath=3D/local/=
domain/0/backend/vif/7/0/state
libxl: debug: libxl_event.c:877:devstate_callback: backend /local/domain/0/=
backend/vif/7/0/state wanted state 2 ok
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=3D0x2=
0c67f0 wpath=3D/local/domain/0/backend/vif/7/0/state token=3D3/1: deregiste=
r slotnum=3D3
libxl: debug: libxl_device.c:1117:device_backend_callback: Domain 7:calling=
 device_backend_cleanup
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0c67f0: deregister unregistered
libxl: debug: libxl_device.c:1218:device_hotplug: Domain 7:calling hotplug =
script: /etc/xen/scripts/vif-bridge online
libxl: debug: libxl_device.c:1219:device_hotplug: Domain 7:extra args:
libxl: debug: libxl_device.c:1225:device_hotplug: Domain 7:	type_if=3Dvif
libxl: debug: libxl_device.c:1227:device_hotplug: Domain 7:env:
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	script: /etc/xe=
n/scripts/vif-bridge
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	XENBUS_TYPE: vif
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	XENBUS_PATH: ba=
ckend/vif/7/0
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	XENBUS_BASE_PAT=
H: backend
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	netdev:=20
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	vif: vif7.0
libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to execu=
te: /etc/xen/scripts/vif-bridge online=20
libxl: debug: libxl_event.c:545:watchfd_callback: watch epath=3D/local/doma=
in/0/backend/vif/7/0/state token=3D3/1: empty slot
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=3D0x20c6f30 wpath=
=3D/local/domain/0/backend/vif/7/1/state token=3D2/2: event epath=3D/local/=
domain/0/backend/vif/7/1/state
libxl: debug: libxl_event.c:877:devstate_callback: backend /local/domain/0/=
backend/vif/7/1/state wanted state 2 ok
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=3D0x2=
0c6f30 wpath=3D/local/domain/0/backend/vif/7/1/state token=3D2/2: deregiste=
r slotnum=3D2
libxl: debug: libxl_device.c:1117:device_backend_callback: Domain 7:calling=
 device_backend_cleanup
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0c6f30: deregister unregistered
libxl: debug: libxl_device.c:1218:device_hotplug: Domain 7:calling hotplug =
script: /etc/xen/scripts/vif-bridge online
libxl: debug: libxl_device.c:1219:device_hotplug: Domain 7:extra args:
libxl: debug: libxl_device.c:1225:device_hotplug: Domain 7:	type_if=3Dvif
libxl: debug: libxl_device.c:1227:device_hotplug: Domain 7:env:
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	script: /etc/xe=
n/scripts/vif-bridge
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	XENBUS_TYPE: vif
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	XENBUS_PATH: ba=
ckend/vif/7/1
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	XENBUS_BASE_PAT=
H: backend
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	netdev:=20
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 7:	vif: vif7.1
libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to execu=
te: /etc/xen/scripts/vif-bridge online=20
libxl: debug: libxl_event.c:545:watchfd_callback: watch epath=3D/local/doma=
in/0/backend/vif/7/1/state token=3D2/2: empty slot
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0c68f0: deregister unregistered
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 7:No hotplug scrip=
t to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0c68f0: deregister unregistered
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0c7030: deregister unregistered
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 7:No hotplug scrip=
t to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x2=
0c7030: deregister unregistered
libxl: debug: libxl_event.c:2190:libxl__ao_progress_report: ao 0x20c1220: p=
rogress report: ignored
libxl: debug: libxl_event.c:1873:libxl__ao_complete: ao 0x20c1220: complete=
, rc=3D0
libxl: debug: libxl_event.c:1842:libxl__ao__destroy: ao 0x20c1220: destroy
libxl: debug: libxl_qmp.c:779:libxl__qmp_initialize: Domain 7:connected to =
/var/run/xen/qmp-libxl-7
libxl: debug: libxl_qmp.c:343:qmp_handle_response: Domain 7:message type: q=
mp
libxl: debug: libxl_qmp.c:358:qmp_handle_response: Domain 7:QEMU version: 3=
=2E0.0
libxl: debug: libxl_qmp.c:628:qmp_send_prepare: Domain 7:next qmp command: =
'{"execute":"qmp_capabilities","id":1}'
libxl: debug: libxl_qmp.c:343:qmp_handle_response: Domain 7:message type: r=
eturn
libxl: debug: libxl_qmp.c:628:qmp_send_prepare: Domain 7:next qmp command: =
'{"execute":"cont","id":2}'
libxl: debug: libxl_qmp.c:343:qmp_handle_response: Domain 7:message type: r=
eturn
xencall:buffer: debug: total allocations:931 total releases:931
xencall:buffer: debug: current allocations:0 maximum allocations:3
xencall:buffer: debug: cache current size:3
xencall:buffer: debug: cache hits:911 misses:3 toobig:17
xencall:buffer: debug: total allocations:0 total releases:0
xencall:buffer: debug: current allocations:0 maximum allocations:0
xencall:buffer: debug: cache current size:0
xencall:buffer: debug: cache hits:0 misses:0 toobig:0

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xl-migrate.txt"

libxl: error: libxl_qmp.c:774:libxl__qmp_initialize: Domain 7:Connection error: Connection refused
libxl: error: libxl_domain.c:1519:libxl__update_avail_vcpus_qmp: Domain 7:Fail to get number of cpus
libxl: error: libxl_domain.c:1642:libxl_retrieve_domain_configuration: Domain 7:Fail to update available cpu map
unable to retrieve domain configuration
xencall:buffer: debug: total allocations:31 total releases:31
xencall:buffer: debug: current allocations:0 maximum allocations:2
xencall:buffer: debug: cache current size:2
xencall:buffer: debug: cache hits:22 misses:2 toobig:7
xencall:buffer: debug: total allocations:0 total releases:0
xencall:buffer: debug: current allocations:0 maximum allocations:0
xencall:buffer: debug: cache current size:0
xencall:buffer: debug: cache hits:0 misses:0 toobig:0

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xenstore-ls.before-migration-xen4.12.txt"

/tool = ""
/tool/xenstored = ""
/local = ""
/local/domain = ""
/local/domain/0 = ""
/local/domain/0/domid = "0"
/local/domain/0/name = "Domain-0"
/local/domain/0/device-model = ""
/local/domain/0/device-model/0 = ""
/local/domain/0/device-model/0/backends = ""
/local/domain/0/device-model/0/backends/console = ""
/local/domain/0/device-model/0/backends/vkbd = ""
/local/domain/0/device-model/0/backends/qdisk = ""
/local/domain/0/device-model/0/backends/vfb = ""
/local/domain/0/device-model/0/backends/qnic = ""
/local/domain/0/device-model/0/state = "running"
/local/domain/0/device-model/7 = ""
/local/domain/0/device-model/7/backends = ""
/local/domain/0/device-model/7/backends/console = ""
/local/domain/0/device-model/7/backends/vkbd = ""
/local/domain/0/device-model/7/backends/qdisk = ""
/local/domain/0/device-model/7/state = "running"
/local/domain/0/memory = ""
/local/domain/0/memory/target = "16777216"
/local/domain/0/memory/static-max = "16777216"
/local/domain/0/backend = ""
/local/domain/0/backend/qdisk = ""
/local/domain/0/backend/qdisk/7 = ""
/local/domain/0/backend/qdisk/7/51712 = ""
/local/domain/0/backend/qdisk/7/51712/frontend = "/local/domain/7/device/vbd/51712"
/local/domain/0/backend/qdisk/7/51712/params = "aio:/path/v83-xvda"
/local/domain/0/backend/qdisk/7/51712/frontend-id = "7"
/local/domain/0/backend/qdisk/7/51712/online = "1"
/local/domain/0/backend/qdisk/7/51712/removable = "0"
/local/domain/0/backend/qdisk/7/51712/bootable = "1"
/local/domain/0/backend/qdisk/7/51712/state = "2"
/local/domain/0/backend/qdisk/7/51712/dev = "xvda"
/local/domain/0/backend/qdisk/7/51712/type = "qdisk"
/local/domain/0/backend/qdisk/7/51712/mode = "w"
/local/domain/0/backend/qdisk/7/51712/device-type = "disk"
/local/domain/0/backend/qdisk/7/51712/discard-enable = "1"
/local/domain/0/backend/qdisk/7/51712/feature-flush-cache = "1"
/local/domain/0/backend/qdisk/7/51712/info = "0"
/local/domain/0/backend/qdisk/7/51712/max-ring-page-order = "4"
/local/domain/0/backend/qdisk/7/51712/feature-discard = "1"
/local/domain/0/backend/qdisk/7/51712/hotplug-status = "connected"
/local/domain/0/backend/qdisk/7/51728 = ""
/local/domain/0/backend/qdisk/7/51728/frontend = "/local/domain/7/device/vbd/51728"
/local/domain/0/backend/qdisk/7/51728/params = "aio:/path/v86-xvdb"
/local/domain/0/backend/qdisk/7/51728/frontend-id = "7"
/local/domain/0/backend/qdisk/7/51728/online = "1"
/local/domain/0/backend/qdisk/7/51728/removable = "0"
/local/domain/0/backend/qdisk/7/51728/bootable = "1"
/local/domain/0/backend/qdisk/7/51728/state = "2"
/local/domain/0/backend/qdisk/7/51728/dev = "xvdb"
/local/domain/0/backend/qdisk/7/51728/type = "qdisk"
/local/domain/0/backend/qdisk/7/51728/mode = "w"
/local/domain/0/backend/qdisk/7/51728/device-type = "disk"
/local/domain/0/backend/qdisk/7/51728/discard-enable = "1"
/local/domain/0/backend/qdisk/7/51728/feature-flush-cache = "1"
/local/domain/0/backend/qdisk/7/51728/info = "0"
/local/domain/0/backend/qdisk/7/51728/max-ring-page-order = "4"
/local/domain/0/backend/qdisk/7/51728/feature-discard = "1"
/local/domain/0/backend/qdisk/7/51728/hotplug-status = "connected"
/local/domain/0/backend/qdisk/7/51744 = ""
/local/domain/0/backend/qdisk/7/51744/frontend = "/local/domain/7/device/vbd/51744"
/local/domain/0/backend/qdisk/7/51744/params = "aio:/path/v87-xvdc"
/local/domain/0/backend/qdisk/7/51744/frontend-id = "7"
/local/domain/0/backend/qdisk/7/51744/online = "1"
/local/domain/0/backend/qdisk/7/51744/removable = "0"
/local/domain/0/backend/qdisk/7/51744/bootable = "1"
/local/domain/0/backend/qdisk/7/51744/state = "2"
/local/domain/0/backend/qdisk/7/51744/dev = "xvdc"
/local/domain/0/backend/qdisk/7/51744/type = "qdisk"
/local/domain/0/backend/qdisk/7/51744/mode = "w"
/local/domain/0/backend/qdisk/7/51744/device-type = "disk"
/local/domain/0/backend/qdisk/7/51744/discard-enable = "1"
/local/domain/0/backend/qdisk/7/51744/feature-flush-cache = "1"
/local/domain/0/backend/qdisk/7/51744/info = "0"
/local/domain/0/backend/qdisk/7/51744/max-ring-page-order = "4"
/local/domain/0/backend/qdisk/7/51744/feature-discard = "1"
/local/domain/0/backend/qdisk/7/51744/hotplug-status = "connected"
/local/domain/0/backend/qdisk/7/51760 = ""
/local/domain/0/backend/qdisk/7/51760/frontend = "/local/domain/7/device/vbd/51760"
/local/domain/0/backend/qdisk/7/51760/params = "aio:/path/v88-xvdd"
/local/domain/0/backend/qdisk/7/51760/frontend-id = "7"
/local/domain/0/backend/qdisk/7/51760/online = "1"
/local/domain/0/backend/qdisk/7/51760/removable = "0"
/local/domain/0/backend/qdisk/7/51760/bootable = "1"
/local/domain/0/backend/qdisk/7/51760/state = "2"
/local/domain/0/backend/qdisk/7/51760/dev = "xvdd"
/local/domain/0/backend/qdisk/7/51760/type = "qdisk"
/local/domain/0/backend/qdisk/7/51760/mode = "w"
/local/domain/0/backend/qdisk/7/51760/device-type = "disk"
/local/domain/0/backend/qdisk/7/51760/discard-enable = "1"
/local/domain/0/backend/qdisk/7/51760/feature-flush-cache = "1"
/local/domain/0/backend/qdisk/7/51760/info = "0"
/local/domain/0/backend/qdisk/7/51760/max-ring-page-order = "4"
/local/domain/0/backend/qdisk/7/51760/feature-discard = "1"
/local/domain/0/backend/qdisk/7/51760/hotplug-status = "connected"
/local/domain/0/backend/qdisk/7/51776 = ""
/local/domain/0/backend/qdisk/7/51776/frontend = "/local/domain/7/device/vbd/51776"
/local/domain/0/backend/qdisk/7/51776/params = "aio:/path/v90-xvde"
/local/domain/0/backend/qdisk/7/51776/frontend-id = "7"
/local/domain/0/backend/qdisk/7/51776/online = "1"
/local/domain/0/backend/qdisk/7/51776/removable = "0"
/local/domain/0/backend/qdisk/7/51776/bootable = "1"
/local/domain/0/backend/qdisk/7/51776/state = "2"
/local/domain/0/backend/qdisk/7/51776/dev = "xvde"
/local/domain/0/backend/qdisk/7/51776/type = "qdisk"
/local/domain/0/backend/qdisk/7/51776/mode = "w"
/local/domain/0/backend/qdisk/7/51776/device-type = "disk"
/local/domain/0/backend/qdisk/7/51776/discard-enable = "1"
/local/domain/0/backend/qdisk/7/51776/feature-flush-cache = "1"
/local/domain/0/backend/qdisk/7/51776/info = "0"
/local/domain/0/backend/qdisk/7/51776/max-ring-page-order = "4"
/local/domain/0/backend/qdisk/7/51776/feature-discard = "1"
/local/domain/0/backend/qdisk/7/51776/hotplug-status = "connected"
/local/domain/0/backend/qdisk/7/268441600 = ""
/local/domain/0/backend/qdisk/7/268441600/frontend = "/local/domain/7/device/vbd/268441600"
/local/domain/0/backend/qdisk/7/268441600/params = "aio:/dev/shm/vhostmd0"
/local/domain/0/backend/qdisk/7/268441600/frontend-id = "7"
/local/domain/0/backend/qdisk/7/268441600/online = "1"
/local/domain/0/backend/qdisk/7/268441600/removable = "0"
/local/domain/0/backend/qdisk/7/268441600/bootable = "1"
/local/domain/0/backend/qdisk/7/268441600/state = "2"
/local/domain/0/backend/qdisk/7/268441600/dev = "xvdy"
/local/domain/0/backend/qdisk/7/268441600/type = "qdisk"
/local/domain/0/backend/qdisk/7/268441600/mode = "r"
/local/domain/0/backend/qdisk/7/268441600/device-type = "disk"
/local/domain/0/backend/qdisk/7/268441600/discard-enable = "0"
/local/domain/0/backend/qdisk/7/268441600/feature-flush-cache = "1"
/local/domain/0/backend/qdisk/7/268441600/info = "4"
/local/domain/0/backend/qdisk/7/268441600/max-ring-page-order = "4"
/local/domain/0/backend/qdisk/7/268441600/hotplug-status = "connected"
/local/domain/0/backend/qdisk/7/268441856 = ""
/local/domain/0/backend/qdisk/7/268441856/frontend = "/local/domain/7/device/vbd/268441856"
/local/domain/0/backend/qdisk/7/268441856/params = "aio:/path/v91-xvdz"
/local/domain/0/backend/qdisk/7/268441856/frontend-id = "7"
/local/domain/0/backend/qdisk/7/268441856/online = "1"
/local/domain/0/backend/qdisk/7/268441856/removable = "0"
/local/domain/0/backend/qdisk/7/268441856/bootable = "1"
/local/domain/0/backend/qdisk/7/268441856/state = "2"
/local/domain/0/backend/qdisk/7/268441856/dev = "xvdz"
/local/domain/0/backend/qdisk/7/268441856/type = "qdisk"
/local/domain/0/backend/qdisk/7/268441856/mode = "w"
/local/domain/0/backend/qdisk/7/268441856/device-type = "disk"
/local/domain/0/backend/qdisk/7/268441856/discard-enable = "1"
/local/domain/0/backend/qdisk/7/268441856/feature-flush-cache = "1"
/local/domain/0/backend/qdisk/7/268441856/info = "0"
/local/domain/0/backend/qdisk/7/268441856/max-ring-page-order = "4"
/local/domain/0/backend/qdisk/7/268441856/feature-discard = "1"
/local/domain/0/backend/qdisk/7/268441856/hotplug-status = "connected"
/local/domain/0/backend/console = ""
/local/domain/0/backend/console/7 = ""
/local/domain/0/backend/console/7/0 = ""
/local/domain/0/backend/console/7/0/frontend = "/local/domain/7/console"
/local/domain/0/backend/console/7/0/frontend-id = "7"
/local/domain/0/backend/console/7/0/online = "1"
/local/domain/0/backend/console/7/0/state = "1"
/local/domain/0/backend/console/7/0/protocol = "vt100"
/local/domain/0/backend/vkbd = ""
/local/domain/0/backend/vkbd/7 = ""
/local/domain/0/backend/vkbd/7/0 = ""
/local/domain/0/backend/vkbd/7/0/frontend = "/local/domain/7/device/vkbd/0"
/local/domain/0/backend/vkbd/7/0/frontend-id = "7"
/local/domain/0/backend/vkbd/7/0/online = "1"
/local/domain/0/backend/vkbd/7/0/state = "2"
/local/domain/0/backend/vkbd/7/0/backend-type = "qemu"
/local/domain/0/backend/vkbd/7/0/feature-abs-pointer = "1"
/local/domain/0/backend/vkbd/7/0/feature-raw-pointer = "1"
/local/domain/0/backend/vkbd/7/0/hotplug-status = "connected"
/local/domain/0/backend/vif = ""
/local/domain/0/backend/vif/7 = ""
/local/domain/0/backend/vif/7/0 = ""
/local/domain/0/backend/vif/7/0/frontend = "/local/domain/7/device/vif/0"
/local/domain/0/backend/vif/7/0/frontend-id = "7"
/local/domain/0/backend/vif/7/0/online = "1"
/local/domain/0/backend/vif/7/0/state = "2"
/local/domain/0/backend/vif/7/0/script = "/etc/xen/scripts/vif-bridge"
/local/domain/0/backend/vif/7/0/vifname = "v20"
/local/domain/0/backend/vif/7/0/mac = "00:16:3e:79:78:20"
/local/domain/0/backend/vif/7/0/bridge = "br0"
/local/domain/0/backend/vif/7/0/handle = "0"
/local/domain/0/backend/vif/7/0/type = "vif"
/local/domain/0/backend/vif/7/0/feature-sg = "1"
/local/domain/0/backend/vif/7/0/feature-gso-tcpv4 = "1"
/local/domain/0/backend/vif/7/0/feature-gso-tcpv6 = "1"
/local/domain/0/backend/vif/7/0/feature-ipv6-csum-offload = "1"
/local/domain/0/backend/vif/7/0/feature-rx-copy = "1"
/local/domain/0/backend/vif/7/0/feature-rx-flip = "0"
/local/domain/0/backend/vif/7/0/feature-multicast-control = "1"
/local/domain/0/backend/vif/7/0/feature-split-event-channels = "1"
/local/domain/0/backend/vif/7/0/multi-queue-max-queues = "8"
/local/domain/0/backend/vif/7/0/hotplug-status = "connected"
/local/domain/0/backend/vif/7/1 = ""
/local/domain/0/backend/vif/7/1/frontend = "/local/domain/7/device/vif/1"
/local/domain/0/backend/vif/7/1/frontend-id = "7"
/local/domain/0/backend/vif/7/1/online = "1"
/local/domain/0/backend/vif/7/1/state = "2"
/local/domain/0/backend/vif/7/1/script = "/etc/xen/scripts/vif-bridge"
/local/domain/0/backend/vif/7/1/vifname = "v15"
/local/domain/0/backend/vif/7/1/mac = "00:16:3e:79:78:15"
/local/domain/0/backend/vif/7/1/bridge = "br0"
/local/domain/0/backend/vif/7/1/handle = "1"
/local/domain/0/backend/vif/7/1/type = "vif"
/local/domain/0/backend/vif/7/1/feature-sg = "1"
/local/domain/0/backend/vif/7/1/feature-gso-tcpv4 = "1"
/local/domain/0/backend/vif/7/1/feature-gso-tcpv6 = "1"
/local/domain/0/backend/vif/7/1/feature-ipv6-csum-offload = "1"
/local/domain/0/backend/vif/7/1/feature-rx-copy = "1"
/local/domain/0/backend/vif/7/1/feature-rx-flip = "0"
/local/domain/0/backend/vif/7/1/feature-multicast-control = "1"
/local/domain/0/backend/vif/7/1/feature-split-event-channels = "1"
/local/domain/0/backend/vif/7/1/multi-queue-max-queues = "8"
/local/domain/0/backend/vif/7/1/hotplug-status = "connected"
/local/domain/7 = ""
/local/domain/7/vm = "/vm/3fae4e2e-dcf6-11e8-b1da-76a50c452436"
/local/domain/7/name = "domUname"
/local/domain/7/cpu = ""
/local/domain/7/cpu/0 = ""
/local/domain/7/cpu/0/availability = "online"
/local/domain/7/cpu/1 = ""
/local/domain/7/cpu/1/availability = "online"
/local/domain/7/cpu/2 = ""
/local/domain/7/cpu/2/availability = "online"
/local/domain/7/cpu/3 = ""
/local/domain/7/cpu/3/availability = "online"
/local/domain/7/cpu/4 = ""
/local/domain/7/cpu/4/availability = "online"
/local/domain/7/cpu/5 = ""
/local/domain/7/cpu/5/availability = "online"
/local/domain/7/cpu/6 = ""
/local/domain/7/cpu/6/availability = "online"
/local/domain/7/cpu/7 = ""
/local/domain/7/cpu/7/availability = "online"
/local/domain/7/cpu/8 = ""
/local/domain/7/cpu/8/availability = "online"
/local/domain/7/cpu/9 = ""
/local/domain/7/cpu/9/availability = "online"
/local/domain/7/cpu/10 = ""
/local/domain/7/cpu/10/availability = "online"
/local/domain/7/cpu/11 = ""
/local/domain/7/cpu/11/availability = "online"
/local/domain/7/cpu/12 = ""
/local/domain/7/cpu/12/availability = "online"
/local/domain/7/cpu/13 = ""
/local/domain/7/cpu/13/availability = "online"
/local/domain/7/cpu/14 = ""
/local/domain/7/cpu/14/availability = "online"
/local/domain/7/cpu/15 = ""
/local/domain/7/cpu/15/availability = "online"
/local/domain/7/memory = ""
/local/domain/7/memory/static-max = "33554432"
/local/domain/7/memory/target = "33546240"
/local/domain/7/memory/videoram = "8192"
/local/domain/7/device = ""
/local/domain/7/device/suspend = ""
/local/domain/7/device/suspend/event-channel = ""
/local/domain/7/device/vbd = ""
/local/domain/7/device/vbd/51712 = ""
/local/domain/7/device/vbd/51712/backend = "/local/domain/0/backend/qdisk/7/51712"
/local/domain/7/device/vbd/51712/backend-id = "0"
/local/domain/7/device/vbd/51712/state = "1"
/local/domain/7/device/vbd/51712/virtual-device = "51712"
/local/domain/7/device/vbd/51712/device-type = "disk"
/local/domain/7/device/vbd/51728 = ""
/local/domain/7/device/vbd/51728/backend = "/local/domain/0/backend/qdisk/7/51728"
/local/domain/7/device/vbd/51728/backend-id = "0"
/local/domain/7/device/vbd/51728/state = "1"
/local/domain/7/device/vbd/51728/virtual-device = "51728"
/local/domain/7/device/vbd/51728/device-type = "disk"
/local/domain/7/device/vbd/51744 = ""
/local/domain/7/device/vbd/51744/backend = "/local/domain/0/backend/qdisk/7/51744"
/local/domain/7/device/vbd/51744/backend-id = "0"
/local/domain/7/device/vbd/51744/state = "1"
/local/domain/7/device/vbd/51744/virtual-device = "51744"
/local/domain/7/device/vbd/51744/device-type = "disk"
/local/domain/7/device/vbd/51760 = ""
/local/domain/7/device/vbd/51760/backend = "/local/domain/0/backend/qdisk/7/51760"
/local/domain/7/device/vbd/51760/backend-id = "0"
/local/domain/7/device/vbd/51760/state = "1"
/local/domain/7/device/vbd/51760/virtual-device = "51760"
/local/domain/7/device/vbd/51760/device-type = "disk"
/local/domain/7/device/vbd/51776 = ""
/local/domain/7/device/vbd/51776/backend = "/local/domain/0/backend/qdisk/7/51776"
/local/domain/7/device/vbd/51776/backend-id = "0"
/local/domain/7/device/vbd/51776/state = "1"
/local/domain/7/device/vbd/51776/virtual-device = "51776"
/local/domain/7/device/vbd/51776/device-type = "disk"
/local/domain/7/device/vbd/268441600 = ""
/local/domain/7/device/vbd/268441600/backend = "/local/domain/0/backend/qdisk/7/268441600"
/local/domain/7/device/vbd/268441600/backend-id = "0"
/local/domain/7/device/vbd/268441600/state = "1"
/local/domain/7/device/vbd/268441600/virtual-device = "268441600"
/local/domain/7/device/vbd/268441600/device-type = "disk"
/local/domain/7/device/vbd/268441856 = ""
/local/domain/7/device/vbd/268441856/backend = "/local/domain/0/backend/qdisk/7/268441856"
/local/domain/7/device/vbd/268441856/backend-id = "0"
/local/domain/7/device/vbd/268441856/state = "1"
/local/domain/7/device/vbd/268441856/virtual-device = "268441856"
/local/domain/7/device/vbd/268441856/device-type = "disk"
/local/domain/7/device/vkbd = ""
/local/domain/7/device/vkbd/0 = ""
/local/domain/7/device/vkbd/0/backend = "/local/domain/0/backend/vkbd/7/0"
/local/domain/7/device/vkbd/0/backend-id = "0"
/local/domain/7/device/vkbd/0/state = "1"
/local/domain/7/device/vif = ""
/local/domain/7/device/vif/0 = ""
/local/domain/7/device/vif/0/backend = "/local/domain/0/backend/vif/7/0"
/local/domain/7/device/vif/0/backend-id = "0"
/local/domain/7/device/vif/0/state = "1"
/local/domain/7/device/vif/0/handle = "0"
/local/domain/7/device/vif/0/mac = "00:16:3e:79:78:20"
/local/domain/7/device/vif/1 = ""
/local/domain/7/device/vif/1/backend = "/local/domain/0/backend/vif/7/1"
/local/domain/7/device/vif/1/backend-id = "0"
/local/domain/7/device/vif/1/state = "1"
/local/domain/7/device/vif/1/handle = "1"
/local/domain/7/device/vif/1/mac = "00:16:3e:79:78:15"
/local/domain/7/control = ""
/local/domain/7/control/shutdown = ""
/local/domain/7/control/feature-poweroff = ""
/local/domain/7/control/feature-reboot = ""
/local/domain/7/control/feature-suspend = ""
/local/domain/7/control/feature-s3 = ""
/local/domain/7/control/feature-s4 = ""
/local/domain/7/control/sysrq = ""
/local/domain/7/control/platform-feature-multiprocessor-suspend = "1"
/local/domain/7/control/platform-feature-xs_reset_watches = "1"
/local/domain/7/hvmloader = ""
/local/domain/7/hvmloader/bios = "seabios"
/local/domain/7/hvmloader/allow-memory-relocate = "0"
/local/domain/7/data = ""
/local/domain/7/drivers = ""
/local/domain/7/feature = ""
/local/domain/7/attr = ""
/local/domain/7/domid = "7"
/local/domain/7/store = ""
/local/domain/7/store/port = "1"
/local/domain/7/store/ring-ref = "1044476"
/local/domain/7/platform = ""
/local/domain/7/platform/acpi = "1"
/local/domain/7/platform/acpi_s3 = "1"
/local/domain/7/platform/acpi_s4 = "1"
/local/domain/7/platform/acpi_laptop_slate = "0"
/local/domain/7/platform/device-model = "qemu_xen"
/local/domain/7/console = ""
/local/domain/7/console/backend = "/local/domain/0/backend/console/7/0"
/local/domain/7/console/backend-id = "0"
/local/domain/7/console/limit = "1048576"
/local/domain/7/console/type = "xenconsoled"
/local/domain/7/console/output = "pty"
/local/domain/7/console/tty = "/dev/pts/2"
/local/domain/7/console/port = "2"
/local/domain/7/console/ring-ref = "1044479"
/local/domain/7/console/vnc-listen = "127.0.0.1"
/local/domain/7/console/vnc-port = "5900"
/local/domain/7/image = ""
/local/domain/7/image/device-model-pid = "4583"
/local/domain/7/serial = ""
/local/domain/7/serial/0 = ""
/local/domain/7/serial/0/tty = "/dev/pts/3"
/vm = ""
/vm/3fae4e2e-dcf6-11e8-b1da-76a50c452436 = ""
/vm/3fae4e2e-dcf6-11e8-b1da-76a50c452436/name = "domUname"
/vm/3fae4e2e-dcf6-11e8-b1da-76a50c452436/uuid = "3fae4e2e-dcf6-11e8-b1da-76a50c452436"
/vm/3fae4e2e-dcf6-11e8-b1da-76a50c452436/rtc = ""
/vm/3fae4e2e-dcf6-11e8-b1da-76a50c452436/rtc/timeoffset = ""
/vm/3fae4e2e-dcf6-11e8-b1da-76a50c452436/image = ""
/vm/3fae4e2e-dcf6-11e8-b1da-76a50c452436/image/ostype = "hvm"
/vm/3fae4e2e-dcf6-11e8-b1da-76a50c452436/start_time = "1542877481.75"
/libxl = ""
/libxl/7 = ""
/libxl/7/device = ""
/libxl/7/device/vbd = ""
/libxl/7/device/vbd/51712 = ""
/libxl/7/device/vbd/51712/frontend = "/local/domain/7/device/vbd/51712"
/libxl/7/device/vbd/51712/backend = "/local/domain/0/backend/qdisk/7/51712"
/libxl/7/device/vbd/51712/params = "aio:/path/v83-xvda"
/libxl/7/device/vbd/51712/frontend-id = "7"
/libxl/7/device/vbd/51712/online = "1"
/libxl/7/device/vbd/51712/removable = "0"
/libxl/7/device/vbd/51712/bootable = "1"
/libxl/7/device/vbd/51712/state = "1"
/libxl/7/device/vbd/51712/dev = "xvda"
/libxl/7/device/vbd/51712/type = "qdisk"
/libxl/7/device/vbd/51712/mode = "w"
/libxl/7/device/vbd/51712/device-type = "disk"
/libxl/7/device/vbd/51712/discard-enable = "1"
/libxl/7/device/vbd/51728 = ""
/libxl/7/device/vbd/51728/frontend = "/local/domain/7/device/vbd/51728"
/libxl/7/device/vbd/51728/backend = "/local/domain/0/backend/qdisk/7/51728"
/libxl/7/device/vbd/51728/params = "aio:/path/v86-xvdb"
/libxl/7/device/vbd/51728/frontend-id = "7"
/libxl/7/device/vbd/51728/online = "1"
/libxl/7/device/vbd/51728/removable = "0"
/libxl/7/device/vbd/51728/bootable = "1"
/libxl/7/device/vbd/51728/state = "1"
/libxl/7/device/vbd/51728/dev = "xvdb"
/libxl/7/device/vbd/51728/type = "qdisk"
/libxl/7/device/vbd/51728/mode = "w"
/libxl/7/device/vbd/51728/device-type = "disk"
/libxl/7/device/vbd/51728/discard-enable = "1"
/libxl/7/device/vbd/51744 = ""
/libxl/7/device/vbd/51744/frontend = "/local/domain/7/device/vbd/51744"
/libxl/7/device/vbd/51744/backend = "/local/domain/0/backend/qdisk/7/51744"
/libxl/7/device/vbd/51744/params = "aio:/path/v87-xvdc"
/libxl/7/device/vbd/51744/frontend-id = "7"
/libxl/7/device/vbd/51744/online = "1"
/libxl/7/device/vbd/51744/removable = "0"
/libxl/7/device/vbd/51744/bootable = "1"
/libxl/7/device/vbd/51744/state = "1"
/libxl/7/device/vbd/51744/dev = "xvdc"
/libxl/7/device/vbd/51744/type = "qdisk"
/libxl/7/device/vbd/51744/mode = "w"
/libxl/7/device/vbd/51744/device-type = "disk"
/libxl/7/device/vbd/51744/discard-enable = "1"
/libxl/7/device/vbd/51760 = ""
/libxl/7/device/vbd/51760/frontend = "/local/domain/7/device/vbd/51760"
/libxl/7/device/vbd/51760/backend = "/local/domain/0/backend/qdisk/7/51760"
/libxl/7/device/vbd/51760/params = "aio:/path/v88-xvdd"
/libxl/7/device/vbd/51760/frontend-id = "7"
/libxl/7/device/vbd/51760/online = "1"
/libxl/7/device/vbd/51760/removable = "0"
/libxl/7/device/vbd/51760/bootable = "1"
/libxl/7/device/vbd/51760/state = "1"
/libxl/7/device/vbd/51760/dev = "xvdd"
/libxl/7/device/vbd/51760/type = "qdisk"
/libxl/7/device/vbd/51760/mode = "w"
/libxl/7/device/vbd/51760/device-type = "disk"
/libxl/7/device/vbd/51760/discard-enable = "1"
/libxl/7/device/vbd/51776 = ""
/libxl/7/device/vbd/51776/frontend = "/local/domain/7/device/vbd/51776"
/libxl/7/device/vbd/51776/backend = "/local/domain/0/backend/qdisk/7/51776"
/libxl/7/device/vbd/51776/params = "aio:/path/v90-xvde"
/libxl/7/device/vbd/51776/frontend-id = "7"
/libxl/7/device/vbd/51776/online = "1"
/libxl/7/device/vbd/51776/removable = "0"
/libxl/7/device/vbd/51776/bootable = "1"
/libxl/7/device/vbd/51776/state = "1"
/libxl/7/device/vbd/51776/dev = "xvde"
/libxl/7/device/vbd/51776/type = "qdisk"
/libxl/7/device/vbd/51776/mode = "w"
/libxl/7/device/vbd/51776/device-type = "disk"
/libxl/7/device/vbd/51776/discard-enable = "1"
/libxl/7/device/vbd/268441600 = ""
/libxl/7/device/vbd/268441600/frontend = "/local/domain/7/device/vbd/268441600"
/libxl/7/device/vbd/268441600/backend = "/local/domain/0/backend/qdisk/7/268441600"
/libxl/7/device/vbd/268441600/params = "aio:/dev/shm/vhostmd0"
/libxl/7/device/vbd/268441600/frontend-id = "7"
/libxl/7/device/vbd/268441600/online = "1"
/libxl/7/device/vbd/268441600/removable = "0"
/libxl/7/device/vbd/268441600/bootable = "1"
/libxl/7/device/vbd/268441600/state = "1"
/libxl/7/device/vbd/268441600/dev = "xvdy"
/libxl/7/device/vbd/268441600/type = "qdisk"
/libxl/7/device/vbd/268441600/mode = "r"
/libxl/7/device/vbd/268441600/device-type = "disk"
/libxl/7/device/vbd/268441600/discard-enable = "0"
/libxl/7/device/vbd/268441856 = ""
/libxl/7/device/vbd/268441856/frontend = "/local/domain/7/device/vbd/268441856"
/libxl/7/device/vbd/268441856/backend = "/local/domain/0/backend/qdisk/7/268441856"
/libxl/7/device/vbd/268441856/params = "aio:/path/v91-xvdz"
/libxl/7/device/vbd/268441856/frontend-id = "7"
/libxl/7/device/vbd/268441856/online = "1"
/libxl/7/device/vbd/268441856/removable = "0"
/libxl/7/device/vbd/268441856/bootable = "1"
/libxl/7/device/vbd/268441856/state = "1"
/libxl/7/device/vbd/268441856/dev = "xvdz"
/libxl/7/device/vbd/268441856/type = "qdisk"
/libxl/7/device/vbd/268441856/mode = "w"
/libxl/7/device/vbd/268441856/device-type = "disk"
/libxl/7/device/vbd/268441856/discard-enable = "1"
/libxl/7/device/console = ""
/libxl/7/device/console/0 = ""
/libxl/7/device/console/0/frontend = "/local/domain/7/console"
/libxl/7/device/console/0/backend = "/local/domain/0/backend/console/7/0"
/libxl/7/device/console/0/frontend-id = "7"
/libxl/7/device/console/0/online = "1"
/libxl/7/device/console/0/state = "1"
/libxl/7/device/console/0/protocol = "vt100"
/libxl/7/device/vkbd = ""
/libxl/7/device/vkbd/0 = ""
/libxl/7/device/vkbd/0/frontend = "/local/domain/7/device/vkbd/0"
/libxl/7/device/vkbd/0/backend = "/local/domain/0/backend/vkbd/7/0"
/libxl/7/device/vkbd/0/frontend-id = "7"
/libxl/7/device/vkbd/0/online = "1"
/libxl/7/device/vkbd/0/state = "1"
/libxl/7/device/vkbd/0/backend-type = "qemu"
/libxl/7/device/vif = ""
/libxl/7/device/vif/0 = ""
/libxl/7/device/vif/0/frontend = "/local/domain/7/device/vif/0"
/libxl/7/device/vif/0/backend = "/local/domain/0/backend/vif/7/0"
/libxl/7/device/vif/0/frontend-id = "7"
/libxl/7/device/vif/0/online = "1"
/libxl/7/device/vif/0/state = "1"
/libxl/7/device/vif/0/script = "/etc/xen/scripts/vif-bridge"
/libxl/7/device/vif/0/vifname = "v20"
/libxl/7/device/vif/0/mac = "00:16:3e:79:78:20"
/libxl/7/device/vif/0/bridge = "br0"
/libxl/7/device/vif/0/handle = "0"
/libxl/7/device/vif/0/type = "vif"
/libxl/7/device/vif/1 = ""
/libxl/7/device/vif/1/frontend = "/local/domain/7/device/vif/1"
/libxl/7/device/vif/1/backend = "/local/domain/0/backend/vif/7/1"
/libxl/7/device/vif/1/frontend-id = "7"
/libxl/7/device/vif/1/online = "1"
/libxl/7/device/vif/1/state = "1"
/libxl/7/device/vif/1/script = "/etc/xen/scripts/vif-bridge"
/libxl/7/device/vif/1/vifname = "v15"
/libxl/7/device/vif/1/mac = "00:16:3e:79:78:15"
/libxl/7/device/vif/1/bridge = "br0"
/libxl/7/device/vif/1/handle = "1"
/libxl/7/device/vif/1/type = "vif"
/libxl/7/type = "hvm"
/libxl/7/dm-version = "qemu_xen"

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xl-domUname.log"

Waiting for domain domUname (domid 7) to die [pid 4730]
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x20b75c0 wpath=@releaseDomain token=3/0: register slotnum=3
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x20b75c0 wpath=@releaseDomain token=3/0: event epath=@releaseDomain
libxl: debug: libxl_domain.c:767:domain_death_xswatch_callback: Domain 7:[evg=0x20b6200] nentries=1 rc=1 7..7
libxl: debug: libxl_domain.c:778:domain_death_xswatch_callback: Domain 7:[evg=0x20b6200]   got=domaininfos[0] got->domain=7
libxl: debug: libxl_domain.c:804:domain_death_xswatch_callback: Domain 7:Exists shutdown_reported=0 dominf.flags=ffff0102
libxl: debug: libxl_domain.c:771:domain_death_xswatch_callback: [evg=0] all reported
libxl: debug: libxl_domain.c:833:domain_death_xswatch_callback: domain death search done
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x20b75c0 wpath=@releaseDomain token=3/0: event epath=@releaseDomain
libxl: debug: libxl_domain.c:767:domain_death_xswatch_callback: Domain 7:[evg=0x20b6200] nentries=1 rc=1 7..7
libxl: debug: libxl_domain.c:778:domain_death_xswatch_callback: Domain 7:[evg=0x20b6200]   got=domaininfos[0] got->domain=7
libxl: debug: libxl_domain.c:804:domain_death_xswatch_callback: Domain 7:Exists shutdown_reported=0 dominf.flags=ffff010b
libxl: debug: libxl_domain.c:724:domain_death_occurred: Domain 7:dying
libxl: debug: libxl_domain.c:771:domain_death_xswatch_callback: [evg=0] all reported
libxl: debug: libxl_domain.c:833:domain_death_xswatch_callback: domain death search done
Domain 7 has been destroyed.
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=0x20b75c0 wpath=@releaseDomain token=3/0: deregister slotnum=3
xencall:buffer: debug: total allocations:4 total releases:4
xencall:buffer: debug: current allocations:0 maximum allocations:2
xencall:buffer: debug: cache current size:2
xencall:buffer: debug: cache hits:2 misses:2 toobig:0
xencall:buffer: debug: total allocations:0 total releases:0
xencall:buffer: debug: current allocations:0 maximum allocations:0
xencall:buffer: debug: cache current size:0
xencall:buffer: debug: cache hits:0 misses:0 toobig:0

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="qemu-dm-domUname.log"

qemu-system-i386: -serial pty: char device redirected to /dev/pts/3 (label serial0)
gnttab: error: ioctl GRANT COPY failed 25 : Inappropriate ioctl for device
VNC server running on 127.0.0.1:5900
qemu-system-i386: /home/abuild/rpmbuild/BUILD/xen-4.12.20181120T144428.668f149048/non-dbg/tools/qemu-xen-dir/block/block-backend.c:903: blk_get_attached_dev_id: Assertion `!blk->legacy_dev' failed.

--s/l3CgOIzMHHjg/5--

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW/Z+/QAKCRBdQqD6ppg2
fvHeAJ0VazCzS2BNztwXokZ7Y7hlwvh0MACeOU8F6sPzA7cQ8oIugviq4+oGWQY=
=RYW6
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--


--===============2029909873618459653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2029909873618459653==--
