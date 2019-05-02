From: Viktor Mitin <viktor.mitin.19@gmail.com>
Subject: Re: Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
Date: Thu, 2 May 2019 17:50:08 +0300
Message-ID: <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mTkF=TC=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hMD2T-0005tj-Je
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:50:21 +0000
Received: by mail-io1-xd36.google.com with SMTP id r71so2365912iod.11
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 07:50:20 -0700 (PDT)
In-Reply-To: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

QWRkaW5nIFhlbiBtYWludGFpbmVycyB0byB0aGlzIGVtYWlsIENDLgoKVGhhbmtzCgpPbiBUaHUs
IE1heSAyLCAyMDE5IGF0IDU6MDggUE0gVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21h
aWwuY29tPiB3cm90ZToKPgo+IEhpIEFsbCwKPgo+IFBsZWFzZSBiZSBhd2FyZSB0aGF0IHdlIGhh
dmUgdHJpZWQgWGVuIEFSTTY0IGJ1aWxkIHdpdGgKPiBDT05GSUdfQ09WRVJBR0UgZmVhdHVyZSBl
bmFibGVkLiBUaGUgYnVpbGQgZW52aXJvbm1lbnQgaXMgbmV4dDoKPiBYZW4gVmVyc2lvbnMgdGVz
dGVkOiB4ZW4tNC4xMi1zdGFibGUsIHhlbi00LjEzLXN0YWdpbmcKPiBCb2FyZDogSDNVTENCLCBS
LUNhciBIMyBWZXIuMi4wCj4gUG9reTogWW9jdG8gUHJvamVjdCBSZWZlcmVuY2UgRGlzdHJvIDIu
NC4yCj4gQ29tcGlsZXI6IGFhcmNoNjQtcG9reS1saW51eC1nY2MgKExpbmFybyBHQ0MgNy4yLTIw
MTcuMTEpIDcuMi4xCj4KPiBCb3RoIFhlbiB2ZXJzaW9ucyAoNC4xMiBhbmQgc3RhZ2luZykgcmV0
dXJuICJVbmV4cGVjdGVkIFRyYXA6IERhdGEKPiBBYm9ydCIgaXNzdWUgaW4gY2FzZSBvZiAneGVu
Y292IHJlc2V0JyBvciAneGVuY292IHJlYWQnIGNhbGxzOgo+Cj4gcm9vdEBoM3VsY2I6fiMgeGVu
Y292IHJlc2V0Cj4gKFhFTikgRGF0YSBBYm9ydCBUcmFwLiBTeW5kcm9tZT0weDcKPiAoWEVOKSBX
YWxraW5nIEh5cGVydmlzb3IgVkEgMHgzNjE3MDAgb24gQ1BVMyB2aWEgVFRCUiAweDAwMDAwMDAw
NzgyNjYwMDAKPiAoWEVOKSAwVEhbMHgwXSA9IDB4MDAwMDAwMDA3ODI2NWY3Zgo+IChYRU4pIDFT
VFsweDBdID0gMHgwMDAwMDAwMDc4MjYyZjdmCj4gKFhFTikgMk5EWzB4MV0gPSAweDAwNDAwMDAw
NzgyNWZmN2YKPiAoWEVOKSAzUkRbMHgxNjFdID0gMHgwMDYwMDAwMDc4MWUxZjdlCj4gKFhFTikg
Q1BVMzogVW5leHBlY3RlZCBUcmFwOiBEYXRhIEFib3J0Cj4KPiBBdHRhY2hpbmcgdGhlIG5leHQg
bG9nIGZpbGVzICh6aXBwZWQgaW4KPiB4ZW5fd2l0aF9jb25maWdfY292ZXJhZ2VfbG9ncy56aXAp
IHdpdGggdGhlIGRldGFpbHM6Cj4gLSBhbGwgdGhlIHJ1bi10aW1lIGV4Y2VwdGlvbiBkZXRhaWxz
IChyY2FyaDNfY29uZmlnX2NvdmVyYWdlX3RyYXAubG9nKTsKPiAtIHhlbiBwYWNrYWdlIGJ1aWxk
IGxvZyBmaWxlIHdpdGggY29tcGlsYXRpb24gb3B0aW9ucyAoY29tcGlsYXRpb24ubG9nKTsKPiAt
IHhlbiBoeXBlcnZpc29yIC5jb25maWcgZmlsZSB1c2VkIGZvciB0aGUgYnVpbGQgKHhlbl9kb3Rf
Y29uZmlnLmxvZyk7Cj4KPiBQbGVhc2Ugc2hhcmUgYW55IGNvbW1lbnRzIG9yIGlkZWFzIGFib3V0
IHRoZSBpc3N1ZS4KPgo+IFRoYW5rcywKPiBWaWt0b3IgTWl0aW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
