From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 14:45:39 +0200
Message-ID: <20180411124539.GJ7177@aepfle.de>
References: <ebdd4cb871b2d754959e8358641810d61b3d0856.camel@suse.com>
 <20180410190302.GC7177@aepfle.de>
 <42c5d682348a351420290dc1ecf5b1e2a60b98be.camel@suse.com>
 <20180410200958.GD7177@aepfle.de> <20180410201315.GE7177@aepfle.de>
 <CAAWQecsriGDV9g+m2q5Y79477HGOUN4VDCwmt2hxKF6=8A-kpA@mail.gmail.com>
 <20180411062306.GG7177@aepfle.de>
 <c730538a94b5de4b83aa76883fa050abd5737b94.camel@suse.com>
 <20180411084829.GH7177@aepfle.de>
 <c94a6f9e273acae94c833e7465cb7f1e32ea19f6.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4737678629785442026=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c94a6f9e273acae94c833e7465cb7f1e32ea19f6.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============4737678629785442026==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xsn3knLL3qrmRbVI"
Content-Disposition: inline


--Xsn3knLL3qrmRbVI
Content-Type: multipart/mixed; boundary="nywXBoy70X0GaB8B"
Content-Disposition: inline


--nywXBoy70X0GaB8B
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 11, Dario Faggioli wrote:

> If you're interested in figuring out, I'd like to see:
> - full output of `xl info -n'
> - output of `xl debug-key u'
> - xl vcpu-list
> - xl list -n

Logs for this .cfg attached:

name='fv_sles12sp1.0'
vif=[ 'mac=00:18:3e:58:00:c1,bridge=br0' ]
memory=4444
vcpus=36
serial="pty"
builder="hvm"
kernel="/xen100.migration/olh/bug1088498/nfsroot_sles12sp2.bug1088498/boot/vmlinuz"
ramdisk="/xen100.migration/olh/bug1088498/nfsroot_sles12sp2.bug1088498/boot/initrd"
cmdline="quiet panic=9 root=nfs:xen100:/share/migration/olh/bug1088498/nfsroot_sles12sp2.bug1088498,vers=3,tcp,actimeo=1,nolock readonlyroot ro Xignore_loglevel Xdebug Xsystemd.log_target=kmsg    Xsystemd.log_level=debug Xrd.debug Xrd.shell Xrd.udev.debug Xudev.log-priority=debug Xrd.udev.log-priority=debug console=ttyS0"
cpus="node:2"
#pus="nodes:2"
#pus="nodes:2,^node:0"
#pus_soft="nodes:2,^node:0"
#isk=[ 'file:/xen100.migration/olh/bug1088498/vdisk.fv_sles12sp1.0.disk0.raw,xvda,w',
disk=[ 'file:/xen100.migration/olh/bug1088498/vdisk.fv_sles12sp1.0.disk0.raw,xvda,w',
'file:/fio_tmpfs_bug1081897/fv_sles12sp1.0.ramdisk01.raw,xvdta,w',
'file:/fio_tmpfs_bug1081897/fv_sles12sp1.0.ramdisk02.raw,xvdtb,w',
'file:/fio_tmpfs_bug1081897/fv_sles12sp1.0.ramdisk03.raw,xvdtc,w',
]


Olaf

--nywXBoy70X0GaB8B
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xl-create.txt"

Parsing config from /xen100.migration/olh/bug1088498/fv_sles12sp1.0.tst.cfg
{
    "c_info": {
        "type": "hvm",
        "name": "fv_sles12sp1.0",
        "uuid": "bf6db3fe-4553-456c-b185-c544cd232fb2",
        "run_hotplug_scripts": "True"
    },
    "b_info": {
        "max_vcpus": 36,
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
            15,
            16,
            17,
            18,
            19,
            20,
            21,
            22,
            23,
            24,
            25,
            26,
            27,
            28,
            29,
            30,
            31,
            32,
            33,
            34,
            35
        ],
        "vcpu_hard_affinity": [
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ],
            [

            ]
        ],
        "numa_placement": "False",
        "max_memkb": 4550656,
        "target_memkb": 4550656,
        "shadow_memkb": 72416,
        "sched_params": {

        },
        "claim_mode": "True",
        "kernel": "/xen100.migration/olh/bug1088498/nfsroot_sles12sp2.bug1088498/boot/vmlinuz",
        "cmdline": "quiet panic=9 root=nfs:xen100:/share/migration/olh/bug1088498/nfsroot_sles12sp2.bug1088498,vers=3,tcp,actimeo=1,nolock readonlyroot ro Xignore_loglevel Xdebug Xsystemd.log_target=kmsg    Xsystemd.log_level=debug Xrd.debug Xrd.shell Xrd.udev.debug Xudev.log-priority=debug Xrd.udev.log-priority=debug console=ttyS0",
        "ramdisk": "/xen100.migration/olh/bug1088498/nfsroot_sles12sp2.bug1088498/boot/initrd",
        "type.hvm": {
            "vga": {

            },
            "vnc": {

            },
            "sdl": {

            },
            "spice": {

            },
            "serial": "pty",
            "rdm": {

            }
        },
        "arch_arm": {

        }
    },
    "disks": [
        {
            "pdev_path": "/xen100.migration/olh/bug1088498/vdisk.fv_sles12sp1.0.disk0.raw",
            "vdev": "xvda",
            "format": "raw",
            "readwrite": 1
        },
        {
            "pdev_path": "/fio_tmpfs_bug1081897/fv_sles12sp1.0.ramdisk01.raw",
            "vdev": "xvdta",
            "format": "raw",
            "readwrite": 1
        },
        {
            "pdev_path": "/fio_tmpfs_bug1081897/fv_sles12sp1.0.ramdisk02.raw",
            "vdev": "xvdtb",
            "format": "raw",
            "readwrite": 1
        },
        {
            "pdev_path": "/fio_tmpfs_bug1081897/fv_sles12sp1.0.ramdisk03.raw",
            "vdev": "xvdtc",
            "format": "raw",
            "readwrite": 1
        }
    ],
    "nics": [
        {
            "devid": 0,
            "mac": "00:18:3e:58:00:c1",
            "bridge": "br0"
        }
    ],
    "on_reboot": "restart",
    "on_soft_reset": "soft_reset"
}
libxl: debug: libxl_create.c:1670:do_domain_create: Domain 0:ao 0x1593560: create: how=(nil) callback=(nil) poller=0x1595dd0
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=xvda spec.backend=unknown
libxl: debug: libxl_device.c:432:libxl__device_disk_set_backend: Disk vdev=xvda, using backend phy
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=xvdta spec.backend=unknown
libxl: debug: libxl_device.c:432:libxl__device_disk_set_backend: Disk vdev=xvdta, using backend phy
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=xvdtb spec.backend=unknown
libxl: debug: libxl_device.c:432:libxl__device_disk_set_backend: Disk vdev=xvdtb, using backend phy
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=xvdtc spec.backend=unknown
libxl: debug: libxl_device.c:432:libxl__device_disk_set_backend: Disk vdev=xvdtc, using backend phy
libxl: debug: libxl_create.c:1007:initiate_domain_create: Domain 1:running bootloader
libxl: debug: libxl_bootloader.c:328:libxl__bootloader_run: Domain 1:not a PV/PVH domain, skipping bootloader
libxl: debug: libxl_event.c:686:libxl__ev_xswatch_deregister: watch w=0x1596ec0: deregister unregistered
libxl: error: libxl_sched.c:62:libxl__set_vcpuaffinity: Domain 1:Setting vcpu affinity: Invalid argument
libxl: error: libxl_dom.c:461:libxl__build_pre: setting affinity failed on vcpu `0'
libxl: error: libxl_create.c:1266:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
libxl: debug: libxl_domain.c:1172:devices_destroy_cb: Domain 1:Forked pid 3667 for destroy of domain
libxl: debug: libxl_create.c:1707:do_domain_create: Domain 0:ao 0x1593560: inprogress: poller=0x1595dd0, flags=i
libxl: debug: libxl_event.c:1869:libxl__ao_complete: ao 0x1593560: complete, rc=-3
libxl: debug: libxl_event.c:1838:libxl__ao__destroy: ao 0x1593560: destroy
libxl: debug: libxl_domain.c:902:libxl_domain_destroy: Domain 1:ao 0x1593560: create: how=(nil) callback=(nil) poller=0x1595dd0
libxl: error: libxl_domain.c:1034:libxl__destroy_domid: Domain 1:Non-existant domain
libxl: error: libxl_domain.c:993:domain_destroy_callback: Domain 1:Unable to destroy guest
libxl: error: libxl_domain.c:920:domain_destroy_cb: Domain 1:Destruction of domain failed
libxl: debug: libxl_event.c:1869:libxl__ao_complete: ao 0x1593560: complete, rc=-21
libxl: debug: libxl_domain.c:911:libxl_domain_destroy: Domain 1:ao 0x1593560: inprogress: poller=0x1595dd0, flags=ic
libxl: debug: libxl_event.c:1838:libxl__ao__destroy: ao 0x1593560: destroy
xencall:buffer: debug: total allocations:59 total releases:59
xencall:buffer: debug: current allocations:0 maximum allocations:2
xencall:buffer: debug: cache current size:2
xencall:buffer: debug: cache hits:46 misses:2 toobig:11
xencall:buffer: debug: total allocations:0 total releases:0
xencall:buffer: debug: current allocations:0 maximum allocations:0
xencall:buffer: debug: cache current size:0
xencall:buffer: debug: cache hits:0 misses:0 toobig:0

--nywXBoy70X0GaB8B
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xl-dmesg.txt"

09] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x10] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x11] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x12] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x13] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x14] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x15] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x16] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x17] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x18] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x19] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x20] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x21] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x22] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x23] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x24] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x25] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x26] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x27] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x28] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x29] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x30] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x31] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x32] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x33] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x34] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x35] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x36] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x37] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x38] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x39] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x40] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x41] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x42] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x43] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x44] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x45] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x46] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x47] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x48] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x49] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x50] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x51] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x52] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x53] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x54] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x55] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x56] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x57] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x58] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x59] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x60] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x61] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x62] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x63] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x64] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x65] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x66] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x67] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x68] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x69] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x70] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x71] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x72] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x73] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x74] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x75] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x76] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x77] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x78] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x79] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x80] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x81] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x82] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x83] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x84] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x85] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x86] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x87] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x88] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x89] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x8a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x8b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x8c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x8d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x8f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x90] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x91] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x92] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x93] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x94] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x95] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x96] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x97] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x98] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x99] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa0] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa1] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa2] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa3] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa4] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa5] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa6] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa7] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa8] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa9] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xaa] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xab] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xac] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xad] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xae] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xaf] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb0] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb1] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb2] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb3] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb4] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb5] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb6] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb7] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb8] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb9] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xba] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xbb] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xbc] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xbd] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xbe] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xbf] high level lint[0x1])
(XEN) Overriding APIC driver with bigsmp
(XEN) ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
(XEN) ACPI: IOAPIC (id[0x09] address[0xfec01000] gsi_base[24])
(XEN) IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-47
(XEN) ACPI: IOAPIC (id[0x0a] address[0xfec40000] gsi_base[48])
(XEN) IOAPIC[2]: apic_id 10, version 32, address 0xfec40000, GSI 48-71
(XEN) ACPI: IOAPIC (id[0x0b] address[0xfec80000] gsi_base[72])
(XEN) IOAPIC[3]: apic_id 11, version 32, address 0xfec80000, GSI 72-95
(XEN) ACPI: IOAPIC (id[0x0c] address[0xfecc0000] gsi_base[96])
(XEN) IOAPIC[4]: apic_id 12, version 32, address 0xfecc0000, GSI 96-119
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Phys.  Using 5 I/O APICs
(XEN) ACPI: HPET id: 0x8086a301 base: 0xfed00000
(XEN) ERST table was not found
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 192 CPUs (48 hotplug CPUs)
(XEN) IRQ limits: 120 GSI, 27544 MSI/MSI-X
(XEN) Not enabling x2APIC: depends on iommu_supports_eim.
(XEN) xstate: size: 0x340 and states: 0x7
(XEN) mce_intel.c:782: MCA Capability: firstbank 0, extended MCE MSR 0, BCAST, SER, CMCI
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 17, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 18, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 19, using 0x1
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features:
(XEN)   Compiled-in support: INDIRECT_THUNK
(XEN) BTI mitigations: Thunk RETPOLINE, Others: RSB_NATIVE RSB_VMEXIT
(XEN) XPTI: enabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 2493.993 MHz processor.
(XEN) EFI memory map:
(XEN)  0000000000000-000000008dfff type=7 attr=000000000000000f
(XEN)  000000008e000-000000008ffff type=0 attr=000000000000000f
(XEN)  0000000090000-000000009dfff type=7 attr=000000000000000f
(XEN)  000000009e000-000000009ffff type=2 attr=000000000000000f
(XEN)  0000000100000-00000003fffff type=7 attr=000000000000000f
(XEN)  0000000400000-0000000505fff type=3 attr=000000000000000f
(XEN)  0000000506000-000002e54efff type=7 attr=000000000000000f
(XEN)  000002e54f000-0000048289fff type=2 attr=000000000000000f
(XEN)  000004828a000-0000048309fff type=4 attr=000000000000000f
(XEN)  000004830a000-00000484d1fff type=7 attr=000000000000000f
(XEN)  00000484d2000-0000048a7afff type=2 attr=000000000000000f
(XEN)  0000048a7b000-0000049c7afff type=1 attr=000000000000000f
(XEN)  0000049c7b000-000005ba84fff type=4 attr=000000000000000f
(XEN)  000005ba85000-000005ba85fff type=3 attr=000000000000000f
(XEN)  000005ba86000-000005bc9dfff type=7 attr=000000000000000f
(XEN)  000005bc9e000-000005be88fff type=2 attr=000000000000000f
(XEN)  000005be89000-000005beb8fff type=7 attr=000000000000000f
(XEN)  000005beb9000-000005c288fff type=1 attr=000000000000000f
(XEN)  000005c289000-000005cdbffff type=7 attr=000000000000000f
(XEN)  000005cdc0000-000005d288fff type=3 attr=000000000000000f
(XEN)  000005d289000-000005d688fff type=6 attr=800000000000000f
(XEN)  000005d689000-000005de88fff type=5 attr=800000000000000f
(XEN)  000005de89000-000005e785fff type=0 attr=000000000000000f
(XEN)  000005e786000-0000060952fff type=10 attr=000000000000000f
(XEN)  0000060953000-0000060adbfff type=9 attr=000000000000000f
(XEN)  0000060adc000-0000079c4efff type=7 attr=000000000000000f
(XEN)  0000079c4f000-000007a22dfff type=4 attr=000000000000000f
(XEN)  000007a22e000-000007a22ffff type=7 attr=000000000000000f
(XEN)  000007a230000-000007a28afff type=4 attr=000000000000000f
(XEN)  000007a28b000-000007a2d3fff type=7 attr=000000000000000f
(XEN)  000007a2d4000-000007bafffff type=4 attr=000000000000000f
(XEN)  0000100000000-0001c7fffffff type=7 attr=000000000000000f
(XEN)  00000000a0000-00000000bffff type=0 attr=0000000000000001
(XEN)  00000000c0000-00000000dffff type=0 attr=0000000000000000
(XEN)  00000000e0000-00000000fffff type=0 attr=0000000000000001
(XEN)  000007bb00000-000007bffffff type=0 attr=0000000000000008
(XEN)  000007c000000-000007fbfffff type=0 attr=0000000000000001
(XEN)  000007fc00000-000007fffffff type=0 attr=0000000000000008
(XEN)  0000080000000-000008fffffff type=11 attr=8000000000000001
(XEN)  00000fed1c000-00000fed1ffff type=11 attr=8000000000000001
(XEN) Initing memory sharing.
(XEN) alt table ffff82d0806717f0 -> ffff82d080673658
(XEN) PCI: MCFG configuration 0: base 80000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at 80000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) I/O virtualisation disabled
(XEN) nr_sockets: 5
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) TSC deadline timer enabled
(XEN) Platform timer appears to have unexpectedly wrapped 10 or more times.
(XEN) Defaulting to alternative key handling; send 'A' to switch to normal mode.
(XEN) Allocated console ring of 2048 KiB.
(XEN) mwait-idle: disabled
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN)  - APIC Register Virtualization
(XEN)  - Virtual Interrupt Delivery
(XEN)  - Posted Interrupt Processing
(XEN)  - VMCS shadowing
(XEN)  - VM Functions
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) Adding cpu 4 to runqueue 0
(XEN) Adding cpu 5 to runqueue 0
(XEN) Adding cpu 6 to runqueue 0
(XEN) Adding cpu 7 to runqueue 0
(XEN) Adding cpu 8 to runqueue 0
(XEN) Adding cpu 9 to runqueue 0
(XEN) Adding cpu 10 to runqueue 0
(XEN) Adding cpu 11 to runqueue 0
(XEN) Adding cpu 12 to runqueue 0
(XEN) Adding cpu 13 to runqueue 0
(XEN) Adding cpu 14 to runqueue 0
(XEN) Adding cpu 15 to runqueue 0
(XEN) Adding cpu 16 to runqueue 0
(XEN) Adding cpu 17 to runqueue 0
(XEN) Adding cpu 18 to runqueue 0
(XEN) Adding cpu 19 to runqueue 0
(XEN) Adding cpu 20 to runqueue 0
(XEN) Adding cpu 21 to runqueue 0
(XEN) Adding cpu 22 to runqueue 0
(XEN) Adding cpu 23 to runqueue 0
(XEN) Adding cpu 24 to runqueue 0
(XEN) Adding cpu 25 to runqueue 0
(XEN) Adding cpu 26 to runqueue 0
(XEN) Adding cpu 27 to runqueue 0
(XEN) Adding cpu 28 to runqueue 0
(XEN) Adding cpu 29 to runqueue 0
(XEN) Adding cpu 30 to runqueue 0
(XEN) Adding cpu 31 to runqueue 0
(XEN) Adding cpu 32 to runqueue 0
(XEN) Adding cpu 33 to runqueue 0
(XEN) Adding cpu 34 to runqueue 0
(XEN) Adding cpu 35 to runqueue 0
(XEN) CMCI: threshold 0x2 too large for CPU36 bank 17, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU36 bank 18, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU36 bank 19, using 0x1
(XEN) Adding cpu 36 to runqueue 1
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 37 to runqueue 1
(XEN) Adding cpu 38 to runqueue 1
(XEN) Adding cpu 39 to runqueue 1
(XEN) Adding cpu 40 to runqueue 1
(XEN) Adding cpu 41 to runqueue 1
(XEN) Adding cpu 42 to runqueue 1
(XEN) Adding cpu 43 to runqueue 1
(XEN) Adding cpu 44 to runqueue 1
(XEN) Adding cpu 45 to runqueue 1
(XEN) Adding cpu 46 to runqueue 1
(XEN) Adding cpu 47 to runqueue 1
(XEN) Adding cpu 48 to runqueue 1
(XEN) Adding cpu 49 to runqueue 1
(XEN) Adding cpu 50 to runqueue 1
(XEN) Adding cpu 51 to runqueue 1
(XEN) Adding cpu 52 to runqueue 1
(XEN) Adding cpu 53 to runqueue 1
(XEN) Adding cpu 54 to runqueue 1
(XEN) Adding cpu 55 to runqueue 1
(XEN) Adding cpu 56 to runqueue 1
(XEN) Adding cpu 57 to runqueue 1
(XEN) Adding cpu 58 to runqueue 1
(XEN) Adding cpu 59 to runqueue 1
(XEN) Adding cpu 60 to runqueue 1
(XEN) Adding cpu 61 to runqueue 1
(XEN) Adding cpu 62 to runqueue 1
(XEN) Adding cpu 63 to runqueue 1
(XEN) Adding cpu 64 to runqueue 1
(XEN) Adding cpu 65 to runqueue 1
(XEN) Adding cpu 66 to runqueue 1
(XEN) Adding cpu 67 to runqueue 1
(XEN) Adding cpu 68 to runqueue 1
(XEN) Adding cpu 69 to runqueue 1
(XEN) Adding cpu 70 to runqueue 1
(XEN) Adding cpu 71 to runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU72 bank 17, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU72 bank 18, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU72 bank 19, using 0x1
(XEN) Adding cpu 72 to runqueue 2
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 73 to runqueue 2
(XEN) Adding cpu 74 to runqueue 2
(XEN) Adding cpu 75 to runqueue 2
(XEN) Adding cpu 76 to runqueue 2
(XEN) Adding cpu 77 to runqueue 2
(XEN) Adding cpu 78 to runqueue 2
(XEN) Adding cpu 79 to runqueue 2
(XEN) Adding cpu 80 to runqueue 2
(XEN) Adding cpu 81 to runqueue 2
(XEN) Adding cpu 82 to runqueue 2
(XEN) Adding cpu 83 to runqueue 2
(XEN) Adding cpu 84 to runqueue 2
(XEN) Adding cpu 85 to runqueue 2
(XEN) Adding cpu 86 to runqueue 2
(XEN) Adding cpu 87 to runqueue 2
(XEN) Adding cpu 88 to runqueue 2
(XEN) Adding cpu 89 to runqueue 2
(XEN) Adding cpu 90 to runqueue 2
(XEN) Adding cpu 91 to runqueue 2
(XEN) Adding cpu 92 to runqueue 2
(XEN) Adding cpu 93 to runqueue 2
(XEN) Adding cpu 94 to runqueue 2
(XEN) Adding cpu 95 to runqueue 2
(XEN) Adding cpu 96 to runqueue 2
(XEN) Adding cpu 97 to runqueue 2
(XEN) Adding cpu 98 to runqueue 2
(XEN) Adding cpu 99 to runqueue 2
(XEN) Adding cpu 100 to runqueue 2
(XEN) Adding cpu 101 to runqueue 2
(XEN) Adding cpu 102 to runqueue 2
(XEN) Adding cpu 103 to runqueue 2
(XEN) Adding cpu 104 to runqueue 2
(XEN) Adding cpu 105 to runqueue 2
(XEN) Adding cpu 106 to runqueue 2
(XEN) Adding cpu 107 to runqueue 2
(XEN) CMCI: threshold 0x2 too large for CPU108 bank 17, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU108 bank 18, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU108 bank 19, using 0x1
(XEN) Adding cpu 108 to runqueue 3
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 109 to runqueue 3
(XEN) Adding cpu 110 to runqueue 3
(XEN) Adding cpu 111 to runqueue 3
(XEN) Adding cpu 112 to runqueue 3
(XEN) Adding cpu 113 to runqueue 3
(XEN) Adding cpu 114 to runqueue 3
(XEN) Adding cpu 115 to runqueue 3
(XEN) Adding cpu 116 to runqueue 3
(XEN) Adding cpu 117 to runqueue 3
(XEN) Adding cpu 118 to runqueue 3
(XEN) Adding cpu 119 to runqueue 3
(XEN) Adding cpu 120 to runqueue 3
(XEN) Adding cpu 121 to runqueue 3
(XEN) Adding cpu 122 to runqueue 3
(XEN) Adding cpu 123 to runqueue 3
(XEN) Adding cpu 124 to runqueue 3
(XEN) Adding cpu 125 to runqueue 3
(XEN) Adding cpu 126 to runqueue 3
(XEN) Adding cpu 127 to runqueue 3
(XEN) Adding cpu 128 to runqueue 3
(XEN) Adding cpu 129 to runqueue 3
(XEN) Adding cpu 130 to runqueue 3
(XEN) Adding cpu 131 to runqueue 3
(XEN) Adding cpu 132 to runqueue 3
(XEN) Adding cpu 133 to runqueue 3
(XEN) Adding cpu 134 to runqueue 3
(XEN) Adding cpu 135 to runqueue 3
(XEN) Adding cpu 136 to runqueue 3
(XEN) Adding cpu 137 to runqueue 3
(XEN) Adding cpu 138 to runqueue 3
(XEN) Adding cpu 139 to runqueue 3
(XEN) Adding cpu 140 to runqueue 3
(XEN) Adding cpu 141 to runqueue 3
(XEN) Adding cpu 142 to runqueue 3
(XEN) Adding cpu 143 to runqueue 3
(XEN) Brought up 144 CPUs
(XEN) build-id: 2137921bc738bc97e99c82c05988f698
(XEN) Running stub recovery selftests...
(XEN) traps.c:1569: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d0803753f2
(XEN) traps.c:754: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d0803753f2
(XEN) traps.c:1096: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d0803753f2
(XEN) ACPI sleep modes: S3
(XEN) VPMU: disabled
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Dom0 has maximum 1656 PIRQs
(XEN) grant_table.c:1769:IDLEv0 Expanding d0 grant table from 0 to 1 frames
(XEN) NX (Execute Disable) protection active
(XEN) *** Building a PV Dom0 ***
(XEN) ELF: phdr: paddr=0x1000000 memsz=0xabf000
(XEN) ELF: phdr: paddr=0x1c00000 memsz=0x15b000
(XEN) ELF: phdr: paddr=0x1d5b000 memsz=0x17518
(XEN) ELF: phdr: paddr=0x1d73000 memsz=0x497000
(XEN) ELF: memory: 0x1000000 -> 0x220a000
(XEN) ELF: note: GUEST_OS = "linux"
(XEN) ELF: note: GUEST_VERSION = "2.6"
(XEN) ELF: note: XEN_VERSION = "xen-3.0"
(XEN) ELF: note: VIRT_BASE = 0xffffffff80000000
(XEN) ELF: note: INIT_P2M = 0x8000000000
(XEN) ELF: note: ENTRY = 0xffffffff81d731f0
(XEN) ELF: note: HYPERCALL_PAGE = 0xffffffff81001000
(XEN) ELF: note: FEATURES = "!writable_page_tables|pae_pgdir_above_4gb|writable_descriptor_tables|auto_translated_physmap|supervisor_mode_kernel"
(XEN) ELF: note: SUPPORTED_FEATURES = 0x90d
(XEN) ELF: note: PAE_MODE = "yes"
(XEN) ELF: note: LOADER = "generic"
(XEN) ELF: note: unknown (0xd)
(XEN) ELF: note: SUSPEND_CANCEL = 0x1
(XEN) ELF: note: MOD_START_PFN = 0x1
(XEN) ELF: note: HV_START_LOW = 0xffff800000000000
(XEN) ELF: note: PADDR_OFFSET = 0
(XEN) ELF: addresses:
(XEN)     virt_base        = 0xffffffff80000000
(XEN)     elf_paddr_offset = 0x0
(XEN)     virt_offset      = 0xffffffff80000000
(XEN)     virt_kstart      = 0xffffffff81000000
(XEN)     virt_kend        = 0xffffffff8220a000
(XEN)     virt_entry       = 0xffffffff81d731f0
(XEN)     p2m_base         = 0x8000000000
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x220a000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000774000000->0000000778000000 (8368588 pages to be allocated)
(XEN)  Init. ramdisk: 0000001c7f1cc000->0000001c7ffff788
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff8220a000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008004000000
(XEN)  Start info:    ffffffff8220a000->ffffffff8220a4b4
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff8220b000->ffffffff82220000
(XEN)  Boot stack:    ffffffff82220000->ffffffff82221000
(XEN)  TOTAL:         ffffffff80000000->ffffffff82400000
(XEN)  ENTRY ADDRESS: ffffffff81d731f0
(XEN) Dom0 has maximum 30 VCPUs
(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff81abf000
(XEN) ELF: phdr 1 at 0xffffffff81c00000 -> 0xffffffff81d5b000
(XEN) ELF: phdr 2 at 0xffffffff81d5b000 -> 0xffffffff81d72518
(XEN) ELF: phdr 3 at 0xffffffff81d73000 -> 0xffffffff81f66000
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to Xen)
(XEN) Freed 2048kB init memory
(XEN) d0: Forcing write emulation on MFNs 80000-8ffff
(XEN) PCI add device 0000:ff:08.0
(XEN) PCI add device 0000:ff:08.2
(XEN) PCI add device 0000:ff:09.0
(XEN) PCI add device 0000:ff:09.2
(XEN) PCI add device 0000:ff:0a.0
(XEN) PCI add device 0000:ff:0a.2
(XEN) PCI add device 0000:ff:0b.0
(XEN) PCI add device 0000:ff:0b.1
(XEN) PCI add device 0000:ff:0b.2
(XEN) PCI add device 0000:ff:0b.4
(XEN) PCI add device 0000:ff:0b.5
(XEN) PCI add device 0000:ff:0b.6
(XEN) PCI add device 0000:ff:0c.0
(XEN) PCI add device 0000:ff:0c.1
(XEN) PCI add device 0000:ff:0c.2
(XEN) PCI add device 0000:ff:0c.3
(XEN) PCI add device 0000:ff:0c.4
(XEN) PCI add device 0000:ff:0c.5
(XEN) PCI add device 0000:ff:0c.6
(XEN) PCI add device 0000:ff:0c.7
(XEN) PCI add device 0000:ff:0d.0
(XEN) PCI add device 0000:ff:0d.1
(XEN) PCI add device 0000:ff:0d.2
(XEN) PCI add device 0000:ff:0d.3
(XEN) PCI add device 0000:ff:0d.4
(XEN) PCI add device 0000:ff:0d.5
(XEN) PCI add device 0000:ff:0d.6
(XEN) PCI add device 0000:ff:0d.7
(XEN) PCI add device 0000:ff:0e.0
(XEN) PCI add device 0000:ff:0e.1
(XEN) PCI add device 0000:ff:0f.0
(XEN) PCI add device 0000:ff:0f.1
(XEN) PCI add device 0000:ff:0f.2
(XEN) PCI add device 0000:ff:0f.3
(XEN) PCI add device 0000:ff:0f.4
(XEN) PCI add device 0000:ff:0f.5
(XEN) PCI add device 0000:ff:0f.6
(XEN) PCI add device 0000:ff:10.0
(XEN) PCI add device 0000:ff:10.1
(XEN) PCI add device 0000:ff:10.5
(XEN) PCI add device 0000:ff:10.7
(XEN) PCI add device 0000:ff:12.0
(XEN) PCI add device 0000:ff:12.1
(XEN) PCI add device 0000:ff:12.4
(XEN) PCI add device 0000:ff:12.5
(XEN) PCI add device 0000:ff:13.0
(XEN) PCI add device 0000:ff:13.1
(XEN) PCI add device 0000:ff:13.2
(XEN) PCI add device 0000:ff:13.3
(XEN) PCI add device 0000:ff:13.4
(XEN) PCI add device 0000:ff:13.5
(XEN) PCI add device 0000:ff:13.6
(XEN) PCI add device 0000:ff:13.7
(XEN) PCI add device 0000:ff:14.0
(XEN) PCI add device 0000:ff:14.1
(XEN) PCI add device 0000:ff:14.2
(XEN) PCI add device 0000:ff:14.3
(XEN) PCI add device 0000:ff:14.4
(XEN) PCI add device 0000:ff:14.5
(XEN) PCI add device 0000:ff:14.6
(XEN) PCI add device 0000:ff:14.7
(XEN) PCI add device 0000:ff:15.0
(XEN) PCI add device 0000:ff:15.1
(XEN) PCI add device 0000:ff:15.2
(XEN) PCI add device 0000:ff:15.3
(XEN) PCI add device 0000:ff:16.0
(XEN) PCI add device 0000:ff:16.1
(XEN) PCI add device 0000:ff:16.2
(XEN) PCI add device 0000:ff:16.3
(XEN) PCI add device 0000:ff:16.4
(XEN) PCI add device 0000:ff:16.5
(XEN) PCI add device 0000:ff:16.6
(XEN) PCI add device 0000:ff:16.7
(XEN) PCI add device 0000:ff:17.0
(XEN) PCI add device 0000:ff:17.1
(XEN) PCI add device 0000:ff:17.2
(XEN) PCI add device 0000:ff:17.3
(XEN) PCI add device 0000:ff:17.4
(XEN) PCI add device 0000:ff:17.5
(XEN) PCI add device 0000:ff:17.6
(XEN) PCI add device 0000:ff:17.7
(XEN) PCI add device 0000:ff:18.0
(XEN) PCI add device 0000:ff:18.1
(XEN) PCI add device 0000:ff:18.2
(XEN) PCI add device 0000:ff:18.3
(XEN) PCI add device 0000:ff:1e.0
(XEN) PCI add device 0000:ff:1e.1
(XEN) PCI add device 0000:ff:1e.2
(XEN) PCI add device 0000:ff:1e.3
(XEN) PCI add device 0000:ff:1e.4
(XEN) PCI add device 0000:ff:1f.0
(XEN) PCI add device 0000:ff:1f.2
(XEN) PCI add device 0000:bf:08.0
(XEN) PCI add device 0000:bf:08.2
(XEN) PCI add device 0000:bf:09.0
(XEN) PCI add device 0000:bf:09.2
(XEN) PCI add device 0000:bf:0a.0
(XEN) PCI add device 0000:bf:0a.2
(XEN) PCI add device 0000:bf:0b.0
(XEN) PCI add device 0000:bf:0b.1
(XEN) PCI add device 0000:bf:0b.2
(XEN) PCI add device 0000:bf:0b.4
(XEN) PCI add device 0000:bf:0b.5
(XEN) PCI add device 0000:bf:0b.6
(XEN) PCI add device 0000:bf:0c.0
(XEN) PCI add device 0000:bf:0c.1
(XEN) PCI add device 0000:bf:0c.2
(XEN) PCI add device 0000:bf:0c.3
(XEN) PCI add device 0000:bf:0c.4
(XEN) PCI add device 0000:bf:0c.5
(XEN) PCI add device 0000:bf:0c.6
(XEN) PCI add device 0000:bf:0c.7
(XEN) PCI add device 0000:bf:0d.0
(XEN) PCI add device 0000:bf:0d.1
(XEN) PCI add device 0000:bf:0d.2
(XEN) PCI add device 0000:bf:0d.3
(XEN) PCI add device 0000:bf:0d.4
(XEN) PCI add device 0000:bf:0d.5
(XEN) PCI add device 0000:bf:0d.6
(XEN) PCI add device 0000:bf:0d.7
(XEN) PCI add device 0000:bf:0e.0
(XEN) PCI add device 0000:bf:0e.1
(XEN) PCI add device 0000:bf:0f.0
(XEN) PCI add device 0000:bf:0f.1
(XEN) PCI add device 0000:bf:0f.2
(XEN) PCI add device 0000:bf:0f.3
(XEN) PCI add device 0000:bf:0f.4
(XEN) PCI add device 0000:bf:0f.5
(XEN) PCI add device 0000:bf:0f.6
(XEN) PCI add device 0000:bf:10.0
(XEN) PCI add device 0000:bf:10.1
(XEN) PCI add device 0000:bf:10.5
(XEN) PCI add device 0000:bf:10.7
(XEN) PCI add device 0000:bf:12.0
(XEN) PCI add device 0000:bf:12.1
(XEN) PCI add device 0000:bf:12.4
(XEN) PCI add device 0000:bf:12.5
(XEN) PCI add device 0000:bf:13.0
(XEN) PCI add device 0000:bf:13.1
(XEN) PCI add device 0000:bf:13.2
(XEN) PCI add device 0000:bf:13.3
(XEN) PCI add device 0000:bf:13.4
(XEN) PCI add device 0000:bf:13.5
(XEN) PCI add device 0000:bf:13.6
(XEN) PCI add device 0000:bf:13.7
(XEN) PCI add device 0000:bf:14.0
(XEN) PCI add device 0000:bf:14.1
(XEN) PCI add device 0000:bf:14.2
(XEN) PCI add device 0000:bf:14.3
(XEN) PCI add device 0000:bf:14.4
(XEN) PCI add device 0000:bf:14.5
(XEN) PCI add device 0000:bf:14.6
(XEN) PCI add device 0000:bf:14.7
(XEN) PCI add device 0000:bf:15.0
(XEN) PCI add device 0000:bf:15.1
(XEN) PCI add device 0000:bf:15.2
(XEN) PCI add device 0000:bf:15.3
(XEN) PCI add device 0000:bf:16.0
(XEN) PCI add device 0000:bf:16.1
(XEN) PCI add device 0000:bf:16.2
(XEN) PCI add device 0000:bf:16.3
(XEN) PCI add device 0000:bf:16.4
(XEN) PCI add device 0000:bf:16.5
(XEN) PCI add device 0000:bf:16.6
(XEN) PCI add device 0000:bf:16.7
(XEN) PCI add device 0000:bf:17.0
(XEN) PCI add device 0000:bf:17.1
(XEN) PCI add device 0000:bf:17.2
(XEN) PCI add device 0000:bf:17.3
(XEN) PCI add device 0000:bf:17.4
(XEN) PCI add device 0000:bf:17.5
(XEN) PCI add device 0000:bf:17.6
(XEN) PCI add device 0000:bf:17.7
(XEN) PCI add device 0000:bf:18.0
(XEN) PCI add device 0000:bf:18.1
(XEN) PCI add device 0000:bf:18.2
(XEN) PCI add device 0000:bf:18.3
(XEN) PCI add device 0000:bf:1e.0
(XEN) PCI add device 0000:bf:1e.1
(XEN) PCI add device 0000:bf:1e.2
(XEN) PCI add device 0000:bf:1e.3
(XEN) PCI add device 0000:bf:1e.4
(XEN) PCI add device 0000:bf:1f.0
(XEN) PCI add device 0000:bf:1f.2
(XEN) PCI add device 0000:7f:08.0
(XEN) PCI add device 0000:7f:08.2
(XEN) PCI add device 0000:7f:09.0
(XEN) PCI add device 0000:7f:09.2
(XEN) PCI add device 0000:7f:0a.0
(XEN) PCI add device 0000:7f:0a.2
(XEN) PCI add device 0000:7f:0b.0
(XEN) PCI add device 0000:7f:0b.1
(XEN) PCI add device 0000:7f:0b.2
(XEN) PCI add device 0000:7f:0b.4
(XEN) PCI add device 0000:7f:0b.5
(XEN) PCI add device 0000:7f:0b.6
(XEN) PCI add device 0000:7f:0c.0
(XEN) PCI add device 0000:7f:0c.1
(XEN) PCI add device 0000:7f:0c.2
(XEN) PCI add device 0000:7f:0c.3
(XEN) PCI add device 0000:7f:0c.4
(XEN) PCI add device 0000:7f:0c.5
(XEN) PCI add device 0000:7f:0c.6
(XEN) PCI add device 0000:7f:0c.7
(XEN) PCI add device 0000:7f:0d.0
(XEN) PCI add device 0000:7f:0d.1
(XEN) PCI add device 0000:7f:0d.2
(XEN) PCI add device 0000:7f:0d.3
(XEN) PCI add device 0000:7f:0d.4
(XEN) PCI add device 0000:7f:0d.5
(XEN) PCI add device 0000:7f:0d.6
(XEN) PCI add device 0000:7f:0d.7
(XEN) PCI add device 0000:7f:0e.0
(XEN) PCI add device 0000:7f:0e.1
(XEN) PCI add device 0000:7f:0f.0
(XEN) PCI add device 0000:7f:0f.1
(XEN) PCI add device 0000:7f:0f.2
(XEN) PCI add device 0000:7f:0f.3
(XEN) PCI add device 0000:7f:0f.4
(XEN) PCI add device 0000:7f:0f.5
(XEN) PCI add device 0000:7f:0f.6
(XEN) PCI add device 0000:7f:10.0
(XEN) PCI add device 0000:7f:10.1
(XEN) PCI add device 0000:7f:10.5
(XEN) PCI add device 0000:7f:10.7
(XEN) PCI add device 0000:7f:12.0
(XEN) PCI add device 0000:7f:12.1
(XEN) PCI add device 0000:7f:12.4
(XEN) PCI add device 0000:7f:12.5
(XEN) PCI add device 0000:7f:13.0
(XEN) PCI add device 0000:7f:13.1
(XEN) PCI add device 0000:7f:13.2
(XEN) PCI add device 0000:7f:13.3
(XEN) PCI add device 0000:7f:13.4
(XEN) PCI add device 0000:7f:13.5
(XEN) PCI add device 0000:7f:13.6
(XEN) PCI add device 0000:7f:13.7
(XEN) PCI add device 0000:7f:14.0
(XEN) PCI add device 0000:7f:14.1
(XEN) PCI add device 0000:7f:14.2
(XEN) PCI add device 0000:7f:14.3
(XEN) PCI add device 0000:7f:14.4
(XEN) PCI add device 0000:7f:14.5
(XEN) PCI add device 0000:7f:14.6
(XEN) PCI add device 0000:7f:14.7
(XEN) PCI add device 0000:7f:15.0
(XEN) PCI add device 0000:7f:15.1
(XEN) PCI add device 0000:7f:15.2
(XEN) PCI add device 0000:7f:15.3
(XEN) PCI add device 0000:7f:16.0
(XEN) PCI add device 0000:7f:16.1
(XEN) PCI add device 0000:7f:16.2
(XEN) PCI add device 0000:7f:16.3
(XEN) PCI add device 0000:7f:16.4
(XEN) PCI add device 0000:7f:16.5
(XEN) PCI add device 0000:7f:16.6
(XEN) PCI add device 0000:7f:16.7
(XEN) PCI add device 0000:7f:17.0
(XEN) PCI add device 0000:7f:17.1
(XEN) PCI add device 0000:7f:17.2
(XEN) PCI add device 0000:7f:17.3
(XEN) PCI add device 0000:7f:17.4
(XEN) PCI add device 0000:7f:17.5
(XEN) PCI add device 0000:7f:17.6
(XEN) PCI add device 0000:7f:17.7
(XEN) PCI add device 0000:7f:18.0
(XEN) PCI add device 0000:7f:18.1
(XEN) PCI add device 0000:7f:18.2
(XEN) PCI add device 0000:7f:18.3
(XEN) PCI add device 0000:7f:1e.0
(XEN) PCI add device 0000:7f:1e.1
(XEN) PCI add device 0000:7f:1e.2
(XEN) PCI add device 0000:7f:1e.3
(XEN) PCI add device 0000:7f:1e.4
(XEN) PCI add device 0000:7f:1f.0
(XEN) PCI add device 0000:7f:1f.2
(XEN) PCI add device 0000:3f:08.0
(XEN) PCI add device 0000:3f:08.2
(XEN) PCI add device 0000:3f:09.0
(XEN) PCI add device 0000:3f:09.2
(XEN) PCI add device 0000:3f:0a.0
(XEN) PCI add device 0000:3f:0a.2
(XEN) PCI add device 0000:3f:0b.0
(XEN) PCI add device 0000:3f:0b.1
(XEN) PCI add device 0000:3f:0b.2
(XEN) PCI add device 0000:3f:0b.4
(XEN) PCI add device 0000:3f:0b.5
(XEN) PCI add device 0000:3f:0b.6
(XEN) PCI add device 0000:3f:0c.0
(XEN) PCI add device 0000:3f:0c.1
(XEN) PCI add device 0000:3f:0c.2
(XEN) PCI add device 0000:3f:0c.3
(XEN) PCI add device 0000:3f:0c.4
(XEN) PCI add device 0000:3f:0c.5
(XEN) PCI add device 0000:3f:0c.6
(XEN) PCI add device 0000:3f:0c.7
(XEN) PCI add device 0000:3f:0d.0
(XEN) PCI add device 0000:3f:0d.1
(XEN) PCI add device 0000:3f:0d.2
(XEN) PCI add device 0000:3f:0d.3
(XEN) PCI add device 0000:3f:0d.4
(XEN) PCI add device 0000:3f:0d.5
(XEN) PCI add device 0000:3f:0d.6
(XEN) PCI add device 0000:3f:0d.7
(XEN) PCI add device 0000:3f:0e.0
(XEN) PCI add device 0000:3f:0e.1
(XEN) PCI add device 0000:3f:0f.0
(XEN) PCI add device 0000:3f:0f.1
(XEN) PCI add device 0000:3f:0f.2
(XEN) PCI add device 0000:3f:0f.3
(XEN) PCI add device 0000:3f:0f.4
(XEN) PCI add device 0000:3f:0f.5
(XEN) PCI add device 0000:3f:0f.6
(XEN) PCI add device 0000:3f:10.0
(XEN) PCI add device 0000:3f:10.1
(XEN) PCI add device 0000:3f:10.5
(XEN) PCI add device 0000:3f:10.7
(XEN) PCI add device 0000:3f:12.0
(XEN) PCI add device 0000:3f:12.1
(XEN) PCI add device 0000:3f:12.4
(XEN) PCI add device 0000:3f:12.5
(XEN) PCI add device 0000:3f:13.0
(XEN) PCI add device 0000:3f:13.1
(XEN) PCI add device 0000:3f:13.2
(XEN) PCI add device 0000:3f:13.3
(XEN) PCI add device 0000:3f:13.4
(XEN) PCI add device 0000:3f:13.5
(XEN) PCI add device 0000:3f:13.6
(XEN) PCI add device 0000:3f:13.7
(XEN) PCI add device 0000:3f:14.0
(XEN) PCI add device 0000:3f:14.1
(XEN) PCI add device 0000:3f:14.2
(XEN) PCI add device 0000:3f:14.3
(XEN) PCI add device 0000:3f:14.4
(XEN) PCI add device 0000:3f:14.5
(XEN) PCI add device 0000:3f:14.6
(XEN) PCI add device 0000:3f:14.7
(XEN) PCI add device 0000:3f:15.0
(XEN) PCI add device 0000:3f:15.1
(XEN) PCI add device 0000:3f:15.2
(XEN) PCI add device 0000:3f:15.3
(XEN) PCI add device 0000:3f:16.0
(XEN) PCI add device 0000:3f:16.1
(XEN) PCI add device 0000:3f:16.2
(XEN) PCI add device 0000:3f:16.3
(XEN) PCI add device 0000:3f:16.4
(XEN) PCI add device 0000:3f:16.5
(XEN) PCI add device 0000:3f:16.6
(XEN) PCI add device 0000:3f:16.7
(XEN) PCI add device 0000:3f:17.0
(XEN) PCI add device 0000:3f:17.1
(XEN) PCI add device 0000:3f:17.2
(XEN) PCI add device 0000:3f:17.3
(XEN) PCI add device 0000:3f:17.4
(XEN) PCI add device 0000:3f:17.5
(XEN) PCI add device 0000:3f:17.6
(XEN) PCI add device 0000:3f:17.7
(XEN) PCI add device 0000:3f:18.0
(XEN) PCI add device 0000:3f:18.1
(XEN) PCI add device 0000:3f:18.2
(XEN) PCI add device 0000:3f:18.3
(XEN) PCI add device 0000:3f:1e.0
(XEN) PCI add device 0000:3f:1e.1
(XEN) PCI add device 0000:3f:1e.2
(XEN) PCI add device 0000:3f:1e.3
(XEN) PCI add device 0000:3f:1e.4
(XEN) PCI add device 0000:3f:1f.0
(XEN) PCI add device 0000:3f:1f.2
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:02.0
(XEN) PCI add device 0000:00:03.0
(XEN) PCI add device 0000:00:03.2
(XEN) PCI add device 0000:00:03.3
(XEN) PCI add device 0000:00:05.0
(XEN) PCI add device 0000:00:05.1
(XEN) PCI add device 0000:00:05.2
(XEN) PCI add device 0000:00:05.4
(XEN) PCI add device 0000:00:11.0
(XEN) PCI add device 0000:00:16.0
(XEN) PCI add device 0000:00:16.1
(XEN) PCI add device 0000:00:1a.0
(XEN) PCI add device 0000:00:1c.0
(XEN) PCI add device 0000:00:1c.7
(XEN) PCI add device 0000:00:1d.0
(XEN) PCI add device 0000:00:1e.0
(XEN) PCI add device 0000:00:1f.0
(XEN) PCI add device 0000:00:1f.2
(XEN) PCI add device 0000:00:1f.3
(XEN) PCI add device 0000:01:00.0
(XEN) PCI add device 0000:03:00.0
(XEN) PCI add device 0000:03:00.1
(XEN) PCI add device 0000:08:00.0
(XEN) PCI add device 0000:40:02.0
(XEN) PCI add device 0000:40:02.2
(XEN) PCI add device 0000:40:03.0
(XEN) PCI add device 0000:40:05.0
(XEN) PCI add device 0000:40:05.1
(XEN) PCI add device 0000:40:05.2
(XEN) PCI add device 0000:40:05.4
(XEN) PCI add device 0000:80:02.0
(XEN) PCI add device 0000:80:02.2
(XEN) PCI add device 0000:80:03.0
(XEN) PCI add device 0000:80:05.0
(XEN) PCI add device 0000:80:05.1
(XEN) PCI add device 0000:80:05.2
(XEN) PCI add device 0000:80:05.4
(XEN) PCI add device 0000:c0:02.0
(XEN) PCI add device 0000:c0:02.2
(XEN) PCI add device 0000:c0:03.0
(XEN) PCI add device 0000:c0:05.0
(XEN) PCI add device 0000:c0:05.1
(XEN) PCI add device 0000:c0:05.2
(XEN) PCI add device 0000:c0:05.4
(XEN) PCI add device 0000:c2:00.0
(XEN) PCI add device 0000:c2:00.1
(XEN) emul-priv-op.c:1179:d0v0 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v2 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v4 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v5 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v6 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v7 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v8 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v9 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v10 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v11 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v12 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v13 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v14 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v15 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v16 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v17 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v18 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v19 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v20 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v21 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v22 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v23 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v24 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v25 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v26 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v27 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v28 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v29 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v3 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) d0: Forcing read-only access to MFN fed00
(XEN) traps.c:1569: GPF (0000): ffff82d0803684d5 [emul-priv-op.c#read_msr+0x462/0x4a5] -> ffff82d080375bb0
(XEN) emul-priv-op.c:1179:d0v0 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v2 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v3 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v4 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v5 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v6 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v7 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v8 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v9 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v10 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v11 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v12 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v13 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v14 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v15 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v16 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v17 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v18 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v19 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v20 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v21 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v22 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v23 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v24 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v25 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v26 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v27 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v28 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v29 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) Monitor-Mwait will be used to enter C1 state
(XEN) Monitor-Mwait will be used to enter C2 state
(XEN) No CPU ID for APIC ID 0x24

--nywXBoy70X0GaB8B
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xl-debugkeys-u.txt"

09] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x10] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x11] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x12] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x13] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x14] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x15] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x16] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x17] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x18] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x19] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x1f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x20] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x21] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x22] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x23] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x24] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x25] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x26] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x27] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x28] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x29] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x2f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x30] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x31] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x32] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x33] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x34] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x35] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x36] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x37] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x38] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x39] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x3f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x40] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x41] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x42] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x43] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x44] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x45] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x46] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x47] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x48] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x49] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x4f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x50] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x51] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x52] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x53] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x54] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x55] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x56] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x57] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x58] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x59] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x5f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x60] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x61] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x62] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x63] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x64] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x65] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x66] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x67] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x68] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x69] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x6f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x70] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x71] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x72] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x73] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x74] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x75] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x76] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x77] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x78] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x79] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x7f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x80] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x81] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x82] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x83] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x84] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x85] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x86] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x87] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x88] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x89] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x8a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x8b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x8c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x8d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x8f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x90] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x91] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x92] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x93] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x94] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x95] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x96] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x97] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x98] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x99] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9a] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9b] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9c] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9d] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9e] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x9f] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa0] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa1] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa2] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa3] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa4] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa5] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa6] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa7] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa8] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xa9] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xaa] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xab] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xac] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xad] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xae] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xaf] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb0] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb1] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb2] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb3] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb4] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb5] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb6] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb7] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb8] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xb9] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xba] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xbb] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xbc] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xbd] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xbe] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0xbf] high level lint[0x1])
(XEN) Overriding APIC driver with bigsmp
(XEN) ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
(XEN) ACPI: IOAPIC (id[0x09] address[0xfec01000] gsi_base[24])
(XEN) IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-47
(XEN) ACPI: IOAPIC (id[0x0a] address[0xfec40000] gsi_base[48])
(XEN) IOAPIC[2]: apic_id 10, version 32, address 0xfec40000, GSI 48-71
(XEN) ACPI: IOAPIC (id[0x0b] address[0xfec80000] gsi_base[72])
(XEN) IOAPIC[3]: apic_id 11, version 32, address 0xfec80000, GSI 72-95
(XEN) ACPI: IOAPIC (id[0x0c] address[0xfecc0000] gsi_base[96])
(XEN) IOAPIC[4]: apic_id 12, version 32, address 0xfecc0000, GSI 96-119
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Phys.  Using 5 I/O APICs
(XEN) ACPI: HPET id: 0x8086a301 base: 0xfed00000
(XEN) ERST table was not found
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 192 CPUs (48 hotplug CPUs)
(XEN) IRQ limits: 120 GSI, 27544 MSI/MSI-X
(XEN) Not enabling x2APIC: depends on iommu_supports_eim.
(XEN) xstate: size: 0x340 and states: 0x7
(XEN) mce_intel.c:782: MCA Capability: firstbank 0, extended MCE MSR 0, BCAST, SER, CMCI
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 17, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 18, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 19, using 0x1
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features:
(XEN)   Compiled-in support: INDIRECT_THUNK
(XEN) BTI mitigations: Thunk RETPOLINE, Others: RSB_NATIVE RSB_VMEXIT
(XEN) XPTI: enabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 2493.993 MHz processor.
(XEN) EFI memory map:
(XEN)  0000000000000-000000008dfff type=7 attr=000000000000000f
(XEN)  000000008e000-000000008ffff type=0 attr=000000000000000f
(XEN)  0000000090000-000000009dfff type=7 attr=000000000000000f
(XEN)  000000009e000-000000009ffff type=2 attr=000000000000000f
(XEN)  0000000100000-00000003fffff type=7 attr=000000000000000f
(XEN)  0000000400000-0000000505fff type=3 attr=000000000000000f
(XEN)  0000000506000-000002e54efff type=7 attr=000000000000000f
(XEN)  000002e54f000-0000048289fff type=2 attr=000000000000000f
(XEN)  000004828a000-0000048309fff type=4 attr=000000000000000f
(XEN)  000004830a000-00000484d1fff type=7 attr=000000000000000f
(XEN)  00000484d2000-0000048a7afff type=2 attr=000000000000000f
(XEN)  0000048a7b000-0000049c7afff type=1 attr=000000000000000f
(XEN)  0000049c7b000-000005ba84fff type=4 attr=000000000000000f
(XEN)  000005ba85000-000005ba85fff type=3 attr=000000000000000f
(XEN)  000005ba86000-000005bc9dfff type=7 attr=000000000000000f
(XEN)  000005bc9e000-000005be88fff type=2 attr=000000000000000f
(XEN)  000005be89000-000005beb8fff type=7 attr=000000000000000f
(XEN)  000005beb9000-000005c288fff type=1 attr=000000000000000f
(XEN)  000005c289000-000005cdbffff type=7 attr=000000000000000f
(XEN)  000005cdc0000-000005d288fff type=3 attr=000000000000000f
(XEN)  000005d289000-000005d688fff type=6 attr=800000000000000f
(XEN)  000005d689000-000005de88fff type=5 attr=800000000000000f
(XEN)  000005de89000-000005e785fff type=0 attr=000000000000000f
(XEN)  000005e786000-0000060952fff type=10 attr=000000000000000f
(XEN)  0000060953000-0000060adbfff type=9 attr=000000000000000f
(XEN)  0000060adc000-0000079c4efff type=7 attr=000000000000000f
(XEN)  0000079c4f000-000007a22dfff type=4 attr=000000000000000f
(XEN)  000007a22e000-000007a22ffff type=7 attr=000000000000000f
(XEN)  000007a230000-000007a28afff type=4 attr=000000000000000f
(XEN)  000007a28b000-000007a2d3fff type=7 attr=000000000000000f
(XEN)  000007a2d4000-000007bafffff type=4 attr=000000000000000f
(XEN)  0000100000000-0001c7fffffff type=7 attr=000000000000000f
(XEN)  00000000a0000-00000000bffff type=0 attr=0000000000000001
(XEN)  00000000c0000-00000000dffff type=0 attr=0000000000000000
(XEN)  00000000e0000-00000000fffff type=0 attr=0000000000000001
(XEN)  000007bb00000-000007bffffff type=0 attr=0000000000000008
(XEN)  000007c000000-000007fbfffff type=0 attr=0000000000000001
(XEN)  000007fc00000-000007fffffff type=0 attr=0000000000000008
(XEN)  0000080000000-000008fffffff type=11 attr=8000000000000001
(XEN)  00000fed1c000-00000fed1ffff type=11 attr=8000000000000001
(XEN) Initing memory sharing.
(XEN) alt table ffff82d0806717f0 -> ffff82d080673658
(XEN) PCI: MCFG configuration 0: base 80000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at 80000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) I/O virtualisation disabled
(XEN) nr_sockets: 5
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) TSC deadline timer enabled
(XEN) Platform timer appears to have unexpectedly wrapped 10 or more times.
(XEN) Defaulting to alternative key handling; send 'A' to switch to normal mode.
(XEN) Allocated console ring of 2048 KiB.
(XEN) mwait-idle: disabled
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN)  - APIC Register Virtualization
(XEN)  - Virtual Interrupt Delivery
(XEN)  - Posted Interrupt Processing
(XEN)  - VMCS shadowing
(XEN)  - VM Functions
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) Adding cpu 4 to runqueue 0
(XEN) Adding cpu 5 to runqueue 0
(XEN) Adding cpu 6 to runqueue 0
(XEN) Adding cpu 7 to runqueue 0
(XEN) Adding cpu 8 to runqueue 0
(XEN) Adding cpu 9 to runqueue 0
(XEN) Adding cpu 10 to runqueue 0
(XEN) Adding cpu 11 to runqueue 0
(XEN) Adding cpu 12 to runqueue 0
(XEN) Adding cpu 13 to runqueue 0
(XEN) Adding cpu 14 to runqueue 0
(XEN) Adding cpu 15 to runqueue 0
(XEN) Adding cpu 16 to runqueue 0
(XEN) Adding cpu 17 to runqueue 0
(XEN) Adding cpu 18 to runqueue 0
(XEN) Adding cpu 19 to runqueue 0
(XEN) Adding cpu 20 to runqueue 0
(XEN) Adding cpu 21 to runqueue 0
(XEN) Adding cpu 22 to runqueue 0
(XEN) Adding cpu 23 to runqueue 0
(XEN) Adding cpu 24 to runqueue 0
(XEN) Adding cpu 25 to runqueue 0
(XEN) Adding cpu 26 to runqueue 0
(XEN) Adding cpu 27 to runqueue 0
(XEN) Adding cpu 28 to runqueue 0
(XEN) Adding cpu 29 to runqueue 0
(XEN) Adding cpu 30 to runqueue 0
(XEN) Adding cpu 31 to runqueue 0
(XEN) Adding cpu 32 to runqueue 0
(XEN) Adding cpu 33 to runqueue 0
(XEN) Adding cpu 34 to runqueue 0
(XEN) Adding cpu 35 to runqueue 0
(XEN) CMCI: threshold 0x2 too large for CPU36 bank 17, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU36 bank 18, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU36 bank 19, using 0x1
(XEN) Adding cpu 36 to runqueue 1
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 37 to runqueue 1
(XEN) Adding cpu 38 to runqueue 1
(XEN) Adding cpu 39 to runqueue 1
(XEN) Adding cpu 40 to runqueue 1
(XEN) Adding cpu 41 to runqueue 1
(XEN) Adding cpu 42 to runqueue 1
(XEN) Adding cpu 43 to runqueue 1
(XEN) Adding cpu 44 to runqueue 1
(XEN) Adding cpu 45 to runqueue 1
(XEN) Adding cpu 46 to runqueue 1
(XEN) Adding cpu 47 to runqueue 1
(XEN) Adding cpu 48 to runqueue 1
(XEN) Adding cpu 49 to runqueue 1
(XEN) Adding cpu 50 to runqueue 1
(XEN) Adding cpu 51 to runqueue 1
(XEN) Adding cpu 52 to runqueue 1
(XEN) Adding cpu 53 to runqueue 1
(XEN) Adding cpu 54 to runqueue 1
(XEN) Adding cpu 55 to runqueue 1
(XEN) Adding cpu 56 to runqueue 1
(XEN) Adding cpu 57 to runqueue 1
(XEN) Adding cpu 58 to runqueue 1
(XEN) Adding cpu 59 to runqueue 1
(XEN) Adding cpu 60 to runqueue 1
(XEN) Adding cpu 61 to runqueue 1
(XEN) Adding cpu 62 to runqueue 1
(XEN) Adding cpu 63 to runqueue 1
(XEN) Adding cpu 64 to runqueue 1
(XEN) Adding cpu 65 to runqueue 1
(XEN) Adding cpu 66 to runqueue 1
(XEN) Adding cpu 67 to runqueue 1
(XEN) Adding cpu 68 to runqueue 1
(XEN) Adding cpu 69 to runqueue 1
(XEN) Adding cpu 70 to runqueue 1
(XEN) Adding cpu 71 to runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU72 bank 17, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU72 bank 18, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU72 bank 19, using 0x1
(XEN) Adding cpu 72 to runqueue 2
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 73 to runqueue 2
(XEN) Adding cpu 74 to runqueue 2
(XEN) Adding cpu 75 to runqueue 2
(XEN) Adding cpu 76 to runqueue 2
(XEN) Adding cpu 77 to runqueue 2
(XEN) Adding cpu 78 to runqueue 2
(XEN) Adding cpu 79 to runqueue 2
(XEN) Adding cpu 80 to runqueue 2
(XEN) Adding cpu 81 to runqueue 2
(XEN) Adding cpu 82 to runqueue 2
(XEN) Adding cpu 83 to runqueue 2
(XEN) Adding cpu 84 to runqueue 2
(XEN) Adding cpu 85 to runqueue 2
(XEN) Adding cpu 86 to runqueue 2
(XEN) Adding cpu 87 to runqueue 2
(XEN) Adding cpu 88 to runqueue 2
(XEN) Adding cpu 89 to runqueue 2
(XEN) Adding cpu 90 to runqueue 2
(XEN) Adding cpu 91 to runqueue 2
(XEN) Adding cpu 92 to runqueue 2
(XEN) Adding cpu 93 to runqueue 2
(XEN) Adding cpu 94 to runqueue 2
(XEN) Adding cpu 95 to runqueue 2
(XEN) Adding cpu 96 to runqueue 2
(XEN) Adding cpu 97 to runqueue 2
(XEN) Adding cpu 98 to runqueue 2
(XEN) Adding cpu 99 to runqueue 2
(XEN) Adding cpu 100 to runqueue 2
(XEN) Adding cpu 101 to runqueue 2
(XEN) Adding cpu 102 to runqueue 2
(XEN) Adding cpu 103 to runqueue 2
(XEN) Adding cpu 104 to runqueue 2
(XEN) Adding cpu 105 to runqueue 2
(XEN) Adding cpu 106 to runqueue 2
(XEN) Adding cpu 107 to runqueue 2
(XEN) CMCI: threshold 0x2 too large for CPU108 bank 17, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU108 bank 18, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU108 bank 19, using 0x1
(XEN) Adding cpu 108 to runqueue 3
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 109 to runqueue 3
(XEN) Adding cpu 110 to runqueue 3
(XEN) Adding cpu 111 to runqueue 3
(XEN) Adding cpu 112 to runqueue 3
(XEN) Adding cpu 113 to runqueue 3
(XEN) Adding cpu 114 to runqueue 3
(XEN) Adding cpu 115 to runqueue 3
(XEN) Adding cpu 116 to runqueue 3
(XEN) Adding cpu 117 to runqueue 3
(XEN) Adding cpu 118 to runqueue 3
(XEN) Adding cpu 119 to runqueue 3
(XEN) Adding cpu 120 to runqueue 3
(XEN) Adding cpu 121 to runqueue 3
(XEN) Adding cpu 122 to runqueue 3
(XEN) Adding cpu 123 to runqueue 3
(XEN) Adding cpu 124 to runqueue 3
(XEN) Adding cpu 125 to runqueue 3
(XEN) Adding cpu 126 to runqueue 3
(XEN) Adding cpu 127 to runqueue 3
(XEN) Adding cpu 128 to runqueue 3
(XEN) Adding cpu 129 to runqueue 3
(XEN) Adding cpu 130 to runqueue 3
(XEN) Adding cpu 131 to runqueue 3
(XEN) Adding cpu 132 to runqueue 3
(XEN) Adding cpu 133 to runqueue 3
(XEN) Adding cpu 134 to runqueue 3
(XEN) Adding cpu 135 to runqueue 3
(XEN) Adding cpu 136 to runqueue 3
(XEN) Adding cpu 137 to runqueue 3
(XEN) Adding cpu 138 to runqueue 3
(XEN) Adding cpu 139 to runqueue 3
(XEN) Adding cpu 140 to runqueue 3
(XEN) Adding cpu 141 to runqueue 3
(XEN) Adding cpu 142 to runqueue 3
(XEN) Adding cpu 143 to runqueue 3
(XEN) Brought up 144 CPUs
(XEN) build-id: 2137921bc738bc97e99c82c05988f698
(XEN) Running stub recovery selftests...
(XEN) traps.c:1569: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d0803753f2
(XEN) traps.c:754: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d0803753f2
(XEN) traps.c:1096: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d0803753f2
(XEN) ACPI sleep modes: S3
(XEN) VPMU: disabled
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Dom0 has maximum 1656 PIRQs
(XEN) grant_table.c:1769:IDLEv0 Expanding d0 grant table from 0 to 1 frames
(XEN) NX (Execute Disable) protection active
(XEN) *** Building a PV Dom0 ***
(XEN) ELF: phdr: paddr=0x1000000 memsz=0xabf000
(XEN) ELF: phdr: paddr=0x1c00000 memsz=0x15b000
(XEN) ELF: phdr: paddr=0x1d5b000 memsz=0x17518
(XEN) ELF: phdr: paddr=0x1d73000 memsz=0x497000
(XEN) ELF: memory: 0x1000000 -> 0x220a000
(XEN) ELF: note: GUEST_OS = "linux"
(XEN) ELF: note: GUEST_VERSION = "2.6"
(XEN) ELF: note: XEN_VERSION = "xen-3.0"
(XEN) ELF: note: VIRT_BASE = 0xffffffff80000000
(XEN) ELF: note: INIT_P2M = 0x8000000000
(XEN) ELF: note: ENTRY = 0xffffffff81d731f0
(XEN) ELF: note: HYPERCALL_PAGE = 0xffffffff81001000
(XEN) ELF: note: FEATURES = "!writable_page_tables|pae_pgdir_above_4gb|writable_descriptor_tables|auto_translated_physmap|supervisor_mode_kernel"
(XEN) ELF: note: SUPPORTED_FEATURES = 0x90d
(XEN) ELF: note: PAE_MODE = "yes"
(XEN) ELF: note: LOADER = "generic"
(XEN) ELF: note: unknown (0xd)
(XEN) ELF: note: SUSPEND_CANCEL = 0x1
(XEN) ELF: note: MOD_START_PFN = 0x1
(XEN) ELF: note: HV_START_LOW = 0xffff800000000000
(XEN) ELF: note: PADDR_OFFSET = 0
(XEN) ELF: addresses:
(XEN)     virt_base        = 0xffffffff80000000
(XEN)     elf_paddr_offset = 0x0
(XEN)     virt_offset      = 0xffffffff80000000
(XEN)     virt_kstart      = 0xffffffff81000000
(XEN)     virt_kend        = 0xffffffff8220a000
(XEN)     virt_entry       = 0xffffffff81d731f0
(XEN)     p2m_base         = 0x8000000000
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x220a000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000774000000->0000000778000000 (8368588 pages to be allocated)
(XEN)  Init. ramdisk: 0000001c7f1cc000->0000001c7ffff788
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff8220a000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008004000000
(XEN)  Start info:    ffffffff8220a000->ffffffff8220a4b4
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff8220b000->ffffffff82220000
(XEN)  Boot stack:    ffffffff82220000->ffffffff82221000
(XEN)  TOTAL:         ffffffff80000000->ffffffff82400000
(XEN)  ENTRY ADDRESS: ffffffff81d731f0
(XEN) Dom0 has maximum 30 VCPUs
(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff81abf000
(XEN) ELF: phdr 1 at 0xffffffff81c00000 -> 0xffffffff81d5b000
(XEN) ELF: phdr 2 at 0xffffffff81d5b000 -> 0xffffffff81d72518
(XEN) ELF: phdr 3 at 0xffffffff81d73000 -> 0xffffffff81f66000
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to Xen)
(XEN) Freed 2048kB init memory
(XEN) d0: Forcing write emulation on MFNs 80000-8ffff
(XEN) PCI add device 0000:ff:08.0
(XEN) PCI add device 0000:ff:08.2
(XEN) PCI add device 0000:ff:09.0
(XEN) PCI add device 0000:ff:09.2
(XEN) PCI add device 0000:ff:0a.0
(XEN) PCI add device 0000:ff:0a.2
(XEN) PCI add device 0000:ff:0b.0
(XEN) PCI add device 0000:ff:0b.1
(XEN) PCI add device 0000:ff:0b.2
(XEN) PCI add device 0000:ff:0b.4
(XEN) PCI add device 0000:ff:0b.5
(XEN) PCI add device 0000:ff:0b.6
(XEN) PCI add device 0000:ff:0c.0
(XEN) PCI add device 0000:ff:0c.1
(XEN) PCI add device 0000:ff:0c.2
(XEN) PCI add device 0000:ff:0c.3
(XEN) PCI add device 0000:ff:0c.4
(XEN) PCI add device 0000:ff:0c.5
(XEN) PCI add device 0000:ff:0c.6
(XEN) PCI add device 0000:ff:0c.7
(XEN) PCI add device 0000:ff:0d.0
(XEN) PCI add device 0000:ff:0d.1
(XEN) PCI add device 0000:ff:0d.2
(XEN) PCI add device 0000:ff:0d.3
(XEN) PCI add device 0000:ff:0d.4
(XEN) PCI add device 0000:ff:0d.5
(XEN) PCI add device 0000:ff:0d.6
(XEN) PCI add device 0000:ff:0d.7
(XEN) PCI add device 0000:ff:0e.0
(XEN) PCI add device 0000:ff:0e.1
(XEN) PCI add device 0000:ff:0f.0
(XEN) PCI add device 0000:ff:0f.1
(XEN) PCI add device 0000:ff:0f.2
(XEN) PCI add device 0000:ff:0f.3
(XEN) PCI add device 0000:ff:0f.4
(XEN) PCI add device 0000:ff:0f.5
(XEN) PCI add device 0000:ff:0f.6
(XEN) PCI add device 0000:ff:10.0
(XEN) PCI add device 0000:ff:10.1
(XEN) PCI add device 0000:ff:10.5
(XEN) PCI add device 0000:ff:10.7
(XEN) PCI add device 0000:ff:12.0
(XEN) PCI add device 0000:ff:12.1
(XEN) PCI add device 0000:ff:12.4
(XEN) PCI add device 0000:ff:12.5
(XEN) PCI add device 0000:ff:13.0
(XEN) PCI add device 0000:ff:13.1
(XEN) PCI add device 0000:ff:13.2
(XEN) PCI add device 0000:ff:13.3
(XEN) PCI add device 0000:ff:13.4
(XEN) PCI add device 0000:ff:13.5
(XEN) PCI add device 0000:ff:13.6
(XEN) PCI add device 0000:ff:13.7
(XEN) PCI add device 0000:ff:14.0
(XEN) PCI add device 0000:ff:14.1
(XEN) PCI add device 0000:ff:14.2
(XEN) PCI add device 0000:ff:14.3
(XEN) PCI add device 0000:ff:14.4
(XEN) PCI add device 0000:ff:14.5
(XEN) PCI add device 0000:ff:14.6
(XEN) PCI add device 0000:ff:14.7
(XEN) PCI add device 0000:ff:15.0
(XEN) PCI add device 0000:ff:15.1
(XEN) PCI add device 0000:ff:15.2
(XEN) PCI add device 0000:ff:15.3
(XEN) PCI add device 0000:ff:16.0
(XEN) PCI add device 0000:ff:16.1
(XEN) PCI add device 0000:ff:16.2
(XEN) PCI add device 0000:ff:16.3
(XEN) PCI add device 0000:ff:16.4
(XEN) PCI add device 0000:ff:16.5
(XEN) PCI add device 0000:ff:16.6
(XEN) PCI add device 0000:ff:16.7
(XEN) PCI add device 0000:ff:17.0
(XEN) PCI add device 0000:ff:17.1
(XEN) PCI add device 0000:ff:17.2
(XEN) PCI add device 0000:ff:17.3
(XEN) PCI add device 0000:ff:17.4
(XEN) PCI add device 0000:ff:17.5
(XEN) PCI add device 0000:ff:17.6
(XEN) PCI add device 0000:ff:17.7
(XEN) PCI add device 0000:ff:18.0
(XEN) PCI add device 0000:ff:18.1
(XEN) PCI add device 0000:ff:18.2
(XEN) PCI add device 0000:ff:18.3
(XEN) PCI add device 0000:ff:1e.0
(XEN) PCI add device 0000:ff:1e.1
(XEN) PCI add device 0000:ff:1e.2
(XEN) PCI add device 0000:ff:1e.3
(XEN) PCI add device 0000:ff:1e.4
(XEN) PCI add device 0000:ff:1f.0
(XEN) PCI add device 0000:ff:1f.2
(XEN) PCI add device 0000:bf:08.0
(XEN) PCI add device 0000:bf:08.2
(XEN) PCI add device 0000:bf:09.0
(XEN) PCI add device 0000:bf:09.2
(XEN) PCI add device 0000:bf:0a.0
(XEN) PCI add device 0000:bf:0a.2
(XEN) PCI add device 0000:bf:0b.0
(XEN) PCI add device 0000:bf:0b.1
(XEN) PCI add device 0000:bf:0b.2
(XEN) PCI add device 0000:bf:0b.4
(XEN) PCI add device 0000:bf:0b.5
(XEN) PCI add device 0000:bf:0b.6
(XEN) PCI add device 0000:bf:0c.0
(XEN) PCI add device 0000:bf:0c.1
(XEN) PCI add device 0000:bf:0c.2
(XEN) PCI add device 0000:bf:0c.3
(XEN) PCI add device 0000:bf:0c.4
(XEN) PCI add device 0000:bf:0c.5
(XEN) PCI add device 0000:bf:0c.6
(XEN) PCI add device 0000:bf:0c.7
(XEN) PCI add device 0000:bf:0d.0
(XEN) PCI add device 0000:bf:0d.1
(XEN) PCI add device 0000:bf:0d.2
(XEN) PCI add device 0000:bf:0d.3
(XEN) PCI add device 0000:bf:0d.4
(XEN) PCI add device 0000:bf:0d.5
(XEN) PCI add device 0000:bf:0d.6
(XEN) PCI add device 0000:bf:0d.7
(XEN) PCI add device 0000:bf:0e.0
(XEN) PCI add device 0000:bf:0e.1
(XEN) PCI add device 0000:bf:0f.0
(XEN) PCI add device 0000:bf:0f.1
(XEN) PCI add device 0000:bf:0f.2
(XEN) PCI add device 0000:bf:0f.3
(XEN) PCI add device 0000:bf:0f.4
(XEN) PCI add device 0000:bf:0f.5
(XEN) PCI add device 0000:bf:0f.6
(XEN) PCI add device 0000:bf:10.0
(XEN) PCI add device 0000:bf:10.1
(XEN) PCI add device 0000:bf:10.5
(XEN) PCI add device 0000:bf:10.7
(XEN) PCI add device 0000:bf:12.0
(XEN) PCI add device 0000:bf:12.1
(XEN) PCI add device 0000:bf:12.4
(XEN) PCI add device 0000:bf:12.5
(XEN) PCI add device 0000:bf:13.0
(XEN) PCI add device 0000:bf:13.1
(XEN) PCI add device 0000:bf:13.2
(XEN) PCI add device 0000:bf:13.3
(XEN) PCI add device 0000:bf:13.4
(XEN) PCI add device 0000:bf:13.5
(XEN) PCI add device 0000:bf:13.6
(XEN) PCI add device 0000:bf:13.7
(XEN) PCI add device 0000:bf:14.0
(XEN) PCI add device 0000:bf:14.1
(XEN) PCI add device 0000:bf:14.2
(XEN) PCI add device 0000:bf:14.3
(XEN) PCI add device 0000:bf:14.4
(XEN) PCI add device 0000:bf:14.5
(XEN) PCI add device 0000:bf:14.6
(XEN) PCI add device 0000:bf:14.7
(XEN) PCI add device 0000:bf:15.0
(XEN) PCI add device 0000:bf:15.1
(XEN) PCI add device 0000:bf:15.2
(XEN) PCI add device 0000:bf:15.3
(XEN) PCI add device 0000:bf:16.0
(XEN) PCI add device 0000:bf:16.1
(XEN) PCI add device 0000:bf:16.2
(XEN) PCI add device 0000:bf:16.3
(XEN) PCI add device 0000:bf:16.4
(XEN) PCI add device 0000:bf:16.5
(XEN) PCI add device 0000:bf:16.6
(XEN) PCI add device 0000:bf:16.7
(XEN) PCI add device 0000:bf:17.0
(XEN) PCI add device 0000:bf:17.1
(XEN) PCI add device 0000:bf:17.2
(XEN) PCI add device 0000:bf:17.3
(XEN) PCI add device 0000:bf:17.4
(XEN) PCI add device 0000:bf:17.5
(XEN) PCI add device 0000:bf:17.6
(XEN) PCI add device 0000:bf:17.7
(XEN) PCI add device 0000:bf:18.0
(XEN) PCI add device 0000:bf:18.1
(XEN) PCI add device 0000:bf:18.2
(XEN) PCI add device 0000:bf:18.3
(XEN) PCI add device 0000:bf:1e.0
(XEN) PCI add device 0000:bf:1e.1
(XEN) PCI add device 0000:bf:1e.2
(XEN) PCI add device 0000:bf:1e.3
(XEN) PCI add device 0000:bf:1e.4
(XEN) PCI add device 0000:bf:1f.0
(XEN) PCI add device 0000:bf:1f.2
(XEN) PCI add device 0000:7f:08.0
(XEN) PCI add device 0000:7f:08.2
(XEN) PCI add device 0000:7f:09.0
(XEN) PCI add device 0000:7f:09.2
(XEN) PCI add device 0000:7f:0a.0
(XEN) PCI add device 0000:7f:0a.2
(XEN) PCI add device 0000:7f:0b.0
(XEN) PCI add device 0000:7f:0b.1
(XEN) PCI add device 0000:7f:0b.2
(XEN) PCI add device 0000:7f:0b.4
(XEN) PCI add device 0000:7f:0b.5
(XEN) PCI add device 0000:7f:0b.6
(XEN) PCI add device 0000:7f:0c.0
(XEN) PCI add device 0000:7f:0c.1
(XEN) PCI add device 0000:7f:0c.2
(XEN) PCI add device 0000:7f:0c.3
(XEN) PCI add device 0000:7f:0c.4
(XEN) PCI add device 0000:7f:0c.5
(XEN) PCI add device 0000:7f:0c.6
(XEN) PCI add device 0000:7f:0c.7
(XEN) PCI add device 0000:7f:0d.0
(XEN) PCI add device 0000:7f:0d.1
(XEN) PCI add device 0000:7f:0d.2
(XEN) PCI add device 0000:7f:0d.3
(XEN) PCI add device 0000:7f:0d.4
(XEN) PCI add device 0000:7f:0d.5
(XEN) PCI add device 0000:7f:0d.6
(XEN) PCI add device 0000:7f:0d.7
(XEN) PCI add device 0000:7f:0e.0
(XEN) PCI add device 0000:7f:0e.1
(XEN) PCI add device 0000:7f:0f.0
(XEN) PCI add device 0000:7f:0f.1
(XEN) PCI add device 0000:7f:0f.2
(XEN) PCI add device 0000:7f:0f.3
(XEN) PCI add device 0000:7f:0f.4
(XEN) PCI add device 0000:7f:0f.5
(XEN) PCI add device 0000:7f:0f.6
(XEN) PCI add device 0000:7f:10.0
(XEN) PCI add device 0000:7f:10.1
(XEN) PCI add device 0000:7f:10.5
(XEN) PCI add device 0000:7f:10.7
(XEN) PCI add device 0000:7f:12.0
(XEN) PCI add device 0000:7f:12.1
(XEN) PCI add device 0000:7f:12.4
(XEN) PCI add device 0000:7f:12.5
(XEN) PCI add device 0000:7f:13.0
(XEN) PCI add device 0000:7f:13.1
(XEN) PCI add device 0000:7f:13.2
(XEN) PCI add device 0000:7f:13.3
(XEN) PCI add device 0000:7f:13.4
(XEN) PCI add device 0000:7f:13.5
(XEN) PCI add device 0000:7f:13.6
(XEN) PCI add device 0000:7f:13.7
(XEN) PCI add device 0000:7f:14.0
(XEN) PCI add device 0000:7f:14.1
(XEN) PCI add device 0000:7f:14.2
(XEN) PCI add device 0000:7f:14.3
(XEN) PCI add device 0000:7f:14.4
(XEN) PCI add device 0000:7f:14.5
(XEN) PCI add device 0000:7f:14.6
(XEN) PCI add device 0000:7f:14.7
(XEN) PCI add device 0000:7f:15.0
(XEN) PCI add device 0000:7f:15.1
(XEN) PCI add device 0000:7f:15.2
(XEN) PCI add device 0000:7f:15.3
(XEN) PCI add device 0000:7f:16.0
(XEN) PCI add device 0000:7f:16.1
(XEN) PCI add device 0000:7f:16.2
(XEN) PCI add device 0000:7f:16.3
(XEN) PCI add device 0000:7f:16.4
(XEN) PCI add device 0000:7f:16.5
(XEN) PCI add device 0000:7f:16.6
(XEN) PCI add device 0000:7f:16.7
(XEN) PCI add device 0000:7f:17.0
(XEN) PCI add device 0000:7f:17.1
(XEN) PCI add device 0000:7f:17.2
(XEN) PCI add device 0000:7f:17.3
(XEN) PCI add device 0000:7f:17.4
(XEN) PCI add device 0000:7f:17.5
(XEN) PCI add device 0000:7f:17.6
(XEN) PCI add device 0000:7f:17.7
(XEN) PCI add device 0000:7f:18.0
(XEN) PCI add device 0000:7f:18.1
(XEN) PCI add device 0000:7f:18.2
(XEN) PCI add device 0000:7f:18.3
(XEN) PCI add device 0000:7f:1e.0
(XEN) PCI add device 0000:7f:1e.1
(XEN) PCI add device 0000:7f:1e.2
(XEN) PCI add device 0000:7f:1e.3
(XEN) PCI add device 0000:7f:1e.4
(XEN) PCI add device 0000:7f:1f.0
(XEN) PCI add device 0000:7f:1f.2
(XEN) PCI add device 0000:3f:08.0
(XEN) PCI add device 0000:3f:08.2
(XEN) PCI add device 0000:3f:09.0
(XEN) PCI add device 0000:3f:09.2
(XEN) PCI add device 0000:3f:0a.0
(XEN) PCI add device 0000:3f:0a.2
(XEN) PCI add device 0000:3f:0b.0
(XEN) PCI add device 0000:3f:0b.1
(XEN) PCI add device 0000:3f:0b.2
(XEN) PCI add device 0000:3f:0b.4
(XEN) PCI add device 0000:3f:0b.5
(XEN) PCI add device 0000:3f:0b.6
(XEN) PCI add device 0000:3f:0c.0
(XEN) PCI add device 0000:3f:0c.1
(XEN) PCI add device 0000:3f:0c.2
(XEN) PCI add device 0000:3f:0c.3
(XEN) PCI add device 0000:3f:0c.4
(XEN) PCI add device 0000:3f:0c.5
(XEN) PCI add device 0000:3f:0c.6
(XEN) PCI add device 0000:3f:0c.7
(XEN) PCI add device 0000:3f:0d.0
(XEN) PCI add device 0000:3f:0d.1
(XEN) PCI add device 0000:3f:0d.2
(XEN) PCI add device 0000:3f:0d.3
(XEN) PCI add device 0000:3f:0d.4
(XEN) PCI add device 0000:3f:0d.5
(XEN) PCI add device 0000:3f:0d.6
(XEN) PCI add device 0000:3f:0d.7
(XEN) PCI add device 0000:3f:0e.0
(XEN) PCI add device 0000:3f:0e.1
(XEN) PCI add device 0000:3f:0f.0
(XEN) PCI add device 0000:3f:0f.1
(XEN) PCI add device 0000:3f:0f.2
(XEN) PCI add device 0000:3f:0f.3
(XEN) PCI add device 0000:3f:0f.4
(XEN) PCI add device 0000:3f:0f.5
(XEN) PCI add device 0000:3f:0f.6
(XEN) PCI add device 0000:3f:10.0
(XEN) PCI add device 0000:3f:10.1
(XEN) PCI add device 0000:3f:10.5
(XEN) PCI add device 0000:3f:10.7
(XEN) PCI add device 0000:3f:12.0
(XEN) PCI add device 0000:3f:12.1
(XEN) PCI add device 0000:3f:12.4
(XEN) PCI add device 0000:3f:12.5
(XEN) PCI add device 0000:3f:13.0
(XEN) PCI add device 0000:3f:13.1
(XEN) PCI add device 0000:3f:13.2
(XEN) PCI add device 0000:3f:13.3
(XEN) PCI add device 0000:3f:13.4
(XEN) PCI add device 0000:3f:13.5
(XEN) PCI add device 0000:3f:13.6
(XEN) PCI add device 0000:3f:13.7
(XEN) PCI add device 0000:3f:14.0
(XEN) PCI add device 0000:3f:14.1
(XEN) PCI add device 0000:3f:14.2
(XEN) PCI add device 0000:3f:14.3
(XEN) PCI add device 0000:3f:14.4
(XEN) PCI add device 0000:3f:14.5
(XEN) PCI add device 0000:3f:14.6
(XEN) PCI add device 0000:3f:14.7
(XEN) PCI add device 0000:3f:15.0
(XEN) PCI add device 0000:3f:15.1
(XEN) PCI add device 0000:3f:15.2
(XEN) PCI add device 0000:3f:15.3
(XEN) PCI add device 0000:3f:16.0
(XEN) PCI add device 0000:3f:16.1
(XEN) PCI add device 0000:3f:16.2
(XEN) PCI add device 0000:3f:16.3
(XEN) PCI add device 0000:3f:16.4
(XEN) PCI add device 0000:3f:16.5
(XEN) PCI add device 0000:3f:16.6
(XEN) PCI add device 0000:3f:16.7
(XEN) PCI add device 0000:3f:17.0
(XEN) PCI add device 0000:3f:17.1
(XEN) PCI add device 0000:3f:17.2
(XEN) PCI add device 0000:3f:17.3
(XEN) PCI add device 0000:3f:17.4
(XEN) PCI add device 0000:3f:17.5
(XEN) PCI add device 0000:3f:17.6
(XEN) PCI add device 0000:3f:17.7
(XEN) PCI add device 0000:3f:18.0
(XEN) PCI add device 0000:3f:18.1
(XEN) PCI add device 0000:3f:18.2
(XEN) PCI add device 0000:3f:18.3
(XEN) PCI add device 0000:3f:1e.0
(XEN) PCI add device 0000:3f:1e.1
(XEN) PCI add device 0000:3f:1e.2
(XEN) PCI add device 0000:3f:1e.3
(XEN) PCI add device 0000:3f:1e.4
(XEN) PCI add device 0000:3f:1f.0
(XEN) PCI add device 0000:3f:1f.2
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:02.0
(XEN) PCI add device 0000:00:03.0
(XEN) PCI add device 0000:00:03.2
(XEN) PCI add device 0000:00:03.3
(XEN) PCI add device 0000:00:05.0
(XEN) PCI add device 0000:00:05.1
(XEN) PCI add device 0000:00:05.2
(XEN) PCI add device 0000:00:05.4
(XEN) PCI add device 0000:00:11.0
(XEN) PCI add device 0000:00:16.0
(XEN) PCI add device 0000:00:16.1
(XEN) PCI add device 0000:00:1a.0
(XEN) PCI add device 0000:00:1c.0
(XEN) PCI add device 0000:00:1c.7
(XEN) PCI add device 0000:00:1d.0
(XEN) PCI add device 0000:00:1e.0
(XEN) PCI add device 0000:00:1f.0
(XEN) PCI add device 0000:00:1f.2
(XEN) PCI add device 0000:00:1f.3
(XEN) PCI add device 0000:01:00.0
(XEN) PCI add device 0000:03:00.0
(XEN) PCI add device 0000:03:00.1
(XEN) PCI add device 0000:08:00.0
(XEN) PCI add device 0000:40:02.0
(XEN) PCI add device 0000:40:02.2
(XEN) PCI add device 0000:40:03.0
(XEN) PCI add device 0000:40:05.0
(XEN) PCI add device 0000:40:05.1
(XEN) PCI add device 0000:40:05.2
(XEN) PCI add device 0000:40:05.4
(XEN) PCI add device 0000:80:02.0
(XEN) PCI add device 0000:80:02.2
(XEN) PCI add device 0000:80:03.0
(XEN) PCI add device 0000:80:05.0
(XEN) PCI add device 0000:80:05.1
(XEN) PCI add device 0000:80:05.2
(XEN) PCI add device 0000:80:05.4
(XEN) PCI add device 0000:c0:02.0
(XEN) PCI add device 0000:c0:02.2
(XEN) PCI add device 0000:c0:03.0
(XEN) PCI add device 0000:c0:05.0
(XEN) PCI add device 0000:c0:05.1
(XEN) PCI add device 0000:c0:05.2
(XEN) PCI add device 0000:c0:05.4
(XEN) PCI add device 0000:c2:00.0
(XEN) PCI add device 0000:c2:00.1
(XEN) emul-priv-op.c:1179:d0v0 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v2 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v4 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v5 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v6 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v7 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v8 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v9 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v10 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v11 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v12 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v13 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v14 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v15 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v16 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v17 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v18 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v19 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v20 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v21 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v22 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v23 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v24 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v25 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v26 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v27 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v28 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v29 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) emul-priv-op.c:1179:d0v3 Domain attempted WRMSR 000001fc from 0x0000000021040043 to 0x0000000021040041
(XEN) d0: Forcing read-only access to MFN fed00
(XEN) traps.c:1569: GPF (0000): ffff82d0803684d5 [emul-priv-op.c#read_msr+0x462/0x4a5] -> ffff82d080375bb0
(XEN) emul-priv-op.c:1179:d0v0 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v1 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v2 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v3 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v4 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v5 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v6 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v7 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v8 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v9 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v10 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v11 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v12 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v13 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v14 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v15 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v16 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v17 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v18 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v19 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v20 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v21 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v22 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v23 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v24 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v25 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v26 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v27 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v28 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) emul-priv-op.c:1179:d0v29 Domain attempted WRMSR 0000017f from 0x0000000000000000 to 0x0000000000000002
(XEN) Monitor-Mwait will be used to enter C1 state
(XEN) Monitor-Mwait will be used to enter C2 state
(XEN) No CPU ID for APIC ID 0x24
(XEN) 'u' pressed -> dumping numa info (now-0x32E6:7CBB2A5F)
(XEN) NODE0 start->0 size->7864320 free->473713
(XEN) NODE1 start->7864320 size->7340032 free->5739479
(XEN) NODE2 start->15204352 size->6291456 free->6272619
(XEN) NODE3 start->21495808 size->8388608 free->8130612
(XEN) CPU0...35 -> NODE0
(XEN) CPU36...71 -> NODE1
(XEN) CPU72...107 -> NODE2
(XEN) CPU108...143 -> NODE3
(XEN) Memory location of each domain:
(XEN) Domain 0 (total: 8388608):
(XEN)     Node 0: 6806494
(XEN)     Node 1: 1578478
(XEN)     Node 2: 0
(XEN)     Node 3: 3636

--nywXBoy70X0GaB8B
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xl-info-n.txt"
Content-Transfer-Encoding: quoted-printable

host                   : xen91
release                : 4.4.120-92.70-default
version                : #1 SMP Wed Mar 14 15:59:43 UTC 2018 (52a83de)
machine                : x86_64
nr_cpus                : 144
max_cpu_id             : 191
nr_nodes               : 4
cores_per_socket       : 18
threads_per_core       : 2
cpu_mhz                : 2493
hw_caps                : bfebfbff:77fef3ff:2c100800:00000021:00000001:00003=
fbb:00000000:00000100
virt_caps              : hvm
total_memory           : 114562
free_memory            : 80532
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
cpu_topology           :
cpu:    core    socket     node
  0:       0        0        0
  1:       0        0        0
  2:       1        0        0
  3:       1        0        0
  4:       2        0        0
  5:       2        0        0
  6:       3        0        0
  7:       3        0        0
  8:       4        0        0
  9:       4        0        0
 10:       8        0        0
 11:       8        0        0
 12:       9        0        0
 13:       9        0        0
 14:      10        0        0
 15:      10        0        0
 16:      11        0        0
 17:      11        0        0
 18:      16        0        0
 19:      16        0        0
 20:      17        0        0
 21:      17        0        0
 22:      18        0        0
 23:      18        0        0
 24:      19        0        0
 25:      19        0        0
 26:      20        0        0
 27:      20        0        0
 28:      24        0        0
 29:      24        0        0
 30:      25        0        0
 31:      25        0        0
 32:      26        0        0
 33:      26        0        0
 34:      27        0        0
 35:      27        0        0
 36:       0        1        1
 37:       0        1        1
 38:       1        1        1
 39:       1        1        1
 40:       2        1        1
 41:       2        1        1
 42:       3        1        1
 43:       3        1        1
 44:       4        1        1
 45:       4        1        1
 46:       8        1        1
 47:       8        1        1
 48:       9        1        1
 49:       9        1        1
 50:      10        1        1
 51:      10        1        1
 52:      11        1        1
 53:      11        1        1
 54:      16        1        1
 55:      16        1        1
 56:      17        1        1
 57:      17        1        1
 58:      18        1        1
 59:      18        1        1
 60:      19        1        1
 61:      19        1        1
 62:      20        1        1
 63:      20        1        1
 64:      24        1        1
 65:      24        1        1
 66:      25        1        1
 67:      25        1        1
 68:      26        1        1
 69:      26        1        1
 70:      27        1        1
 71:      27        1        1
 72:       0        2        2
 73:       0        2        2
 74:       1        2        2
 75:       1        2        2
 76:       2        2        2
 77:       2        2        2
 78:       3        2        2
 79:       3        2        2
 80:       4        2        2
 81:       4        2        2
 82:       8        2        2
 83:       8        2        2
 84:       9        2        2
 85:       9        2        2
 86:      10        2        2
 87:      10        2        2
 88:      11        2        2
 89:      11        2        2
 90:      16        2        2
 91:      16        2        2
 92:      17        2        2
 93:      17        2        2
 94:      18        2        2
 95:      18        2        2
 96:      19        2        2
 97:      19        2        2
 98:      20        2        2
 99:      20        2        2
100:      24        2        2
101:      24        2        2
102:      25        2        2
103:      25        2        2
104:      26        2        2
105:      26        2        2
106:      27        2        2
107:      27        2        2
108:       0        3        3
109:       0        3        3
110:       1        3        3
111:       1        3        3
112:       2        3        3
113:       2        3        3
114:       3        3        3
115:       3        3        3
116:       4        3        3
117:       4        3        3
118:       8        3        3
119:       8        3        3
120:       9        3        3
121:       9        3        3
122:      10        3        3
123:      10        3        3
124:      11        3        3
125:      11        3        3
126:      16        3        3
127:      16        3        3
128:      17        3        3
129:      17        3        3
130:      18        3        3
131:      18        3        3
132:      19        3        3
133:      19        3        3
134:      20        3        3
135:      20        3        3
136:      24        3        3
137:      24        3        3
138:      25        3        3
139:      25        3        3
140:      26        3        3
141:      26        3        3
142:      27        3        3
143:      27        3        3
device topology        :
device           node
0000:80:02.0      2
0000:80:02.2      2
0000:80:03.0      2
0000:80:05.0      2
0000:80:05.1      2
0000:80:05.2      2
0000:80:05.4      2
0000:c0:02.0      3
0000:c0:02.2      3
0000:c0:03.0      3
0000:c0:05.0      3
0000:c0:05.1      3
0000:c0:05.2      3
0000:c0:05.4      3
0000:c2:00.0      3
0000:c2:00.1      3
0000:40:02.0      1
0000:40:02.2      1
0000:40:03.0      1
0000:40:05.0      1
0000:40:05.1      1
0000:40:05.2      1
0000:40:05.4      1
numa_info              :
node:    memsize    memfree    distances
   0:     30720       1850      10,21,21,21
   1:     28672      22419      21,10,21,21
   2:     24576      24502      21,21,10,21
   3:     32768      31760      21,21,21,10
xen_major              : 4
xen_minor              : 11
xen_extra              : .20180410T12570
xen_version            : 4.11.20180410T12570
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-=
3.0-x86_32p hvm-3.0-x86_64=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          : 2018-04-10 13:57:09 +0100 git:50f8ba84a5
xen_commandline        : bootscrub=3D0 consoleblank=3D0 nomodeset com1=3D11=
5200,8n1 console=3Dcom1,vga Xrashkernel=3D1024M<4G dom0_mem=3D32G dom0_max_=
vcpus=3D30 dom0_vcpus_pin max_cstate=3D0 loglvl=3Dall guest_loglvl=3Dall su=
se_vtsc_tolerance=3D110000 sched=3Dcredit2
cc_compiler            : gcc-4.8 (SUSE Linux) 4.8.5
cc_compile_by          : debug=3Dy
cc_compile_domain      : olh:bug1087289:sle12sp2_411
cc_compile_date        : Tue Apr 10 13:57:09 UTC 2018
build_id               : 2137921bc738bc97e99c82c05988f698
xend_config_format     : 4

--nywXBoy70X0GaB8B
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xl-list-n.txt"

Name                                        ID   Mem VCPUs	State	Time(s) NODE Affinity
Domain-0                                     0 32768    30     r-----     118.9 0

--nywXBoy70X0GaB8B
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xl-vcp-list.txt"

Name                                ID  VCPU   CPU State   Time(s) Affinity (Hard / Soft)
Domain-0                             0     0    0   -b-      10.1  0 / all
Domain-0                             0     1    1   -b-       3.8  1 / all
Domain-0                             0     2    2   -b-       8.0  2 / all
Domain-0                             0     3    3   -b-       3.2  3 / all
Domain-0                             0     4    4   -b-       3.6  4 / all
Domain-0                             0     5    5   -b-       2.8  5 / all
Domain-0                             0     6    6   -b-       4.9  6 / all
Domain-0                             0     7    7   -b-       3.8  7 / all
Domain-0                             0     8    8   -b-       3.4  8 / all
Domain-0                             0     9    9   -b-       3.5  9 / all
Domain-0                             0    10   10   -b-       3.1  10 / all
Domain-0                             0    11   11   -b-       3.0  11 / all
Domain-0                             0    12   12   -b-       2.3  12 / all
Domain-0                             0    13   13   -b-       3.8  13 / all
Domain-0                             0    14   14   -b-       3.9  14 / all
Domain-0                             0    15   15   -b-       3.3  15 / all
Domain-0                             0    16   16   -b-       4.5  16 / all
Domain-0                             0    17   17   -b-       4.3  17 / all
Domain-0                             0    18   18   -b-       3.8  18 / all
Domain-0                             0    19   19   -b-       3.3  19 / all
Domain-0                             0    20   20   -b-       3.0  20 / all
Domain-0                             0    21   21   -b-       2.8  21 / all
Domain-0                             0    22   22   -b-       2.7  22 / all
Domain-0                             0    23   23   -b-       2.5  23 / all
Domain-0                             0    24   24   -b-       2.4  24 / all
Domain-0                             0    25   25   -b-       2.1  25 / all
Domain-0                             0    26   26   r--       4.3  26 / all
Domain-0                             0    27   27   -b-       9.5  27 / all
Domain-0                             0    28   28   -b-       3.5  28 / all
Domain-0                             0    29   29   -b-       4.2  29 / all

--nywXBoy70X0GaB8B--

--Xsn3knLL3qrmRbVI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWs4DcAAKCRBdQqD6ppg2
frqxAJ4muqdKoy+g2seZ2SHOTB7Ta3SfjwCg7No1uRO+t7d0FcUjQ+IR9MBd+H0=
=8PFf
-----END PGP SIGNATURE-----

--Xsn3knLL3qrmRbVI--


--===============4737678629785442026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4737678629785442026==--
