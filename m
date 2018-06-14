From: =?UTF-8?Q?Kristaps_=C4=8Civkulis?= <kristaps.civkulis@gmail.com>
Subject: Re: strange behavior with Multiboot2 on EFI
Date: Thu, 14 Jun 2018 14:03:34 +0300
Message-ID: <CAJL+N=HoZo3HM59FvDammzKC_J2cQwphe6K8t172EcAqnefLwg@mail.gmail.com>
References: <CAJL+N=F2suXu7Uu0RWX2MBwVfFtdFrSv50ucqYr9jXRdB3Z--A@mail.gmail.com>
 <5B20C33A02000078001CAB6C@prv1-mh.provo.novell.com>
 <CAJL+N=GHBa5z9tYOMGzSGv9m+Fo4G+q06VA38Y8MeB6Q5ok4Dw@mail.gmail.com>
 <5B22425D02000078001CB3CB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lqmm=ja=gmail.com=kristaps.civkulis@srs-us1.protection.inumbo.net>)
 id 1fTQ2S-0005eY-1z
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 11:03:36 +0000
Received: by mail-ot0-x22c.google.com with SMTP id p95-v6so6575310ota.5
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jun 2018 04:03:35 -0700 (PDT)
In-Reply-To: <5B22425D02000078001CB3CB@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SXMgdGhlcmUgc29tZSB3YXkgdG8gZWFzaWx5IHByaW50IHN0YWNrIGR1bXAgd2l0aCBRRU1VPyBB
ZGRpbmcgLWQKZ3Vlc3RfZXJyb3JzIHByaW50cyBvbmx5IHJlZ2lzdGVyIHN0YXRlLgoKMjAxOC0w
Ni0xNCAxMzoyNCBHTVQrMDM6MDAgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPjoKPj4+
PiBPbiAxNC4wNi4xOCBhdCAxMjoxMSwgPGtyaXN0YXBzLmNpdmt1bGlzQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+PiAgQXMgeW91IHNob3VsZCBoYXZlIGEgeGVuLmVmaSBhdmFpbGFibGUgZnJvbSB0aGF0
IHNhbWUgYnVpbGQsIGNvdWxkCj4+PiB5b3UgdHJ5IHJ1bm5pbmcgdGhhdCAoZnJvbSB0aGUgRUZJ
IHNoZWxsKSBpbnN0ZWFkPyBTYWRseSB0aGVyZSdzIG5vIHdheQo+Pj4gdG8gYnlwYXNzIHRoZSBj
YWxsIGluIHRoZSBtdWx0aWJvb3QyIGNhc2UsIHdoaWxlIHdpdGggeGVuLmVmaSB5b3UgY291bGQK
Pj4+IHBhc3MgIi9iYXNldmlkZW8iIHRvIHByZXZlbnQgdGhlIGNhbGwgZnJvbSBiZWluZyBtYWRl
Lgo+Pgo+PiBXaGVuIEkgbGF1bmNoZWQgUUVNVSBJIHByZXNzZWQgRVNDIHRvIGdldCBpbnRvIFVF
RkkgbWVudS4KPj4gV2hpbGUgaW4gVUVGSSBtZW51IEkgZGlkOgo+PiBCb290IE1haW50YWluYW5j
ZSBNYW5hZ2VyIC0+IEJvb3QgT3B0aW9ucyAtPiBBZGQgQm9vdCBPcHRpb24gLT4gY2hvc2UKPj4g
eGVuLmVmaSBmaWxlIGFuZCBpbiBJbnB1dCBPcHRpb25hbCBEYXRhIEkgYWRkZWQgL2Jhc2V2aWRl
byAuIFNhdmVkCj4+IGNoYW5nZXMgYW5kIHRoZW4gYm9vdGVkIHRoaXMgbmV3IGVudHJ5Lgo+PiBB
ZnRlciBmZXcgc2Vjb25kcyBRRU1VIGNyYXNoZWQgd2l0aCBmb2xsb3dpbmcgb3V0cHV0Ogo+Pgo+
PiBxZW11OiBmYXRhbDogVHJ5aW5nIHRvIGV4ZWN1dGUgY29kZSBvdXRzaWRlIFJBTSBvciBST00g
YXQgMHgwMDAwMDAwMDAwMGIwMDAwCj4+IFJBWD0wMDAwMDAwMDAwMDAwMDAwIFJCWD0wMDAwMDAw
MDdlNjIyNDE4IFJDWD0wMDAwMDAwMDAwMDAwMDAwCj4+IFJEWD0wMDAwMDAwMDdmZjA5MzIwCj4+
IFJTST0wMDAwMDAwMDdkODZlMzY4IFJEST0wMDAwMDAwMDdlNjIyNDE4IFJCUD0wMDAwMDAwMDdm
ZjA5MzcwCj4+IFJTUD0wMDAwMDAwMDdmZjA5MmM4Cj4+IFI4ID0wMDAwMDAwMDdmZjI3NmJmIFI5
ID0wMDAwMDAwMDdlNjIzMjk4IFIxMD0wMDAwMDAwMDAwMDAwMDExCj4+IFIxMT0wMDAwMDAwMDAw
MDAwMDAwCj4+IFIxMj0wMDAwMDAwMDAwMDAwMDAxIFIxMz0wMDAwMDAwMDAwM2RhMzY3IFIxND0w
MDAwMDAwMDAwMDAwMDA5Cj4+IFIxNT0wMDAwMDAwMDAwMDAwMDAwCj4+IFJJUD0wMDAwMDAwMDAw
MGFmZmI4IFJGTD0wMDAwMDI0NiBbLS0tWi1QLV0gQ1BMPTAgSUk9MCBBMjA9MSBTTU09MCBITFQ9
MAo+Cj4gUklQIGlzIGNsZWFybHkgZmlzaHksIGJ1dCB3aXRob3V0IGFueSBkdW1wIG9mIHRoZSBz
dGFjayBvbmUgY2FuJ3QgZXZlbiBndWVzcwo+IGhvdyBleGVjdXRpb24gbWFkZSBpdCB0aGVyZS4K
Pgo+IEphbgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
