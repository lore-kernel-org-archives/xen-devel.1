From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 1/2] make: move generated headers to
 qemu-build/
Date: Fri, 23 Mar 2018 10:22:27 +0000
Message-ID: <20180323102227.GF16270__45606.8343985409$1521800540$gmane$org@redhat.com>
References: <1521746188-496856-1-git-send-email-mst@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5j9m=gn=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1ezJqr-0006tk-Pv
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 10:23:13 +0000
Content-Disposition: inline
In-Reply-To: <1521746188-496856-1-git-send-email-mst@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Yongbok Kim <yongbok.kim@mips.com>, Michael Roth <mdroth@linux.vnet.ib>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMjIsIDIwMTggYXQgMDk6Mjc6NTVQTSArMDIwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IE1ha2Ugc3VyZSBhbGwgZ2VuZXJhdGVkIGZpbGVzIGdvIGludG8gcWVtdS1i
dWlsZCBzdWJkaXJlY3RvcnkuCj4gV2UgY2FuIHRoZW4gaW5jbHVkZSB0aGVtIGxpa2UgdGhpczoK
PiAgI2luY2x1ZGUgInFlbXUtYnVpbGQvdHJhY2UuaCIKPiAKPiBUaGlzIHNlcnZlcyB0d28gcHVy
cG9zZXM6Cj4gLSBtYWtlIGl0IGVhc3kgdG8gZGV0ZWN0IHdoaWNoIGZpbGVzIGFyZSBpbiB0aGUg
c291cmNlCj4gICBkaXJlY3RvcnkgKGEgYml0IG1vcmUgd29yayBmb3Igd3JpdGVycywgZWFzaWVy
IGZvciByZWFkZXJzKQo+IC0gcmVkdWNlIGNoYW5jZXMgb2YgY29uZmxpY3RzIHdpdGggcG9zc2li
bGUgc3RhbGUgZmlsZXMgaW4gc291cmNlCj4gICBkaXJlY3RvcnkgKHdoaWNoIGNvdWxkIGJlIGxl
ZnQgb3ZlciBmcm9tIGUuZy4gb2xkIHBhdGNoZXMsIGV0YykKCklmIHBlb3BsZSBjYXJlIGFib3V0
IHRoaXMsIHRoZW4gdGhleSBjYW4ganVzdCBiZSBkb2luZyBhIGJ1aWxkCndpdGggIHNyY2RpciAh
PSBidWlsZGRpciBjb25maWcuICBJZiBwZW9wbGUgYXJlIHVzaW5nIHNyY2RpciA9PSBidWlsZGRp
cgp0aGVuIHRoZXkgbGlrZWx5ICp3YW50KiBhbGwgdGhlIGdlbmVyYXRlZCBmaWxlcyBpbiB0aGVp
ciBzcmNkaXIuCgpJTUhPIGl0IHdvdWxkIGJlIHZhbGlkIGZvciB1cyB0byBjb25zaWRlciBpZiB3
ZSBjb3VsZCBqdXN0IG1hbmRhdGUKc3JjZGlyICE9IGJ1aWxkZGlyLCBidXQgaWYgcGVvcGxlIG9i
amVjdCB0byBzdWNoIGEgcHJvcG9zYWwsIHRoZW4gSQpkb24ndCB0aGluayB3ZSBzaG91bGQgYXJi
aXRyYXJpbHkgbW92ZSBhbGwgZ2VuZXJhdGVkIHNvdXJjZSBmaWxlcwppbiB0aGlzIHdheSwgYXMg
dGhhdCdzIGVmZmVjdGl2ZWx5IHRoZSBzYW1lIHRoaW5nIGZvcmNlZCBvbnRvIGRldnMuCgpSZWdh
cmRzLApEYW5pZWwKLS0gCnw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBz
Oi8vd3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fAp8OiBodHRwczovL2xpYnZpcnQu
b3JnICAgICAgICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5jb20g
OnwKfDogaHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3Lmlu
c3RhZ3JhbS5jb20vZGJlcnJhbmdlIDp8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
