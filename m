From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/3] x86: S3 resume adjustments
Date: Mon, 16 Apr 2018 07:13:19 -0600
Message-ID: <5AD4A16F02000078001BBB87@prv1-mh.provo.novell.com>
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <0bfe793f-272c-a98c-95eb-ee75f5ee6218@invisiblethingslab.com>
 <dff5dbde-0eea-c626-22dd-c8192927f9da@citrix.com>
 <72e260c1-1804-1526-2b94-b7dda32313a3@invisiblethingslab.com>
 <7ac35f02-c3e3-9572-c41e-9c0fa4210afb@citrix.com>
 <4e5b237a-6270-e6d1-a665-caf2a526ff4a@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ulgz=hf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f83wc-0001fM-Dc
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 13:13:18 +0000
In-Reply-To: <4e5b237a-6270-e6d1-a665-caf2a526ff4a@invisiblethingslab.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Simon Gaiser <simon@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA0LjE4IGF0IDIyOjE1LCA8c2ltb25AaW52aXNpYmxldGhpbmdzbGFiLmNvbT4g
d3JvdGU6Cj4gKFhFTikgKioqIERPVUJMRSBGQVVMVCAqKioKPiAoWEVOKSAtLS0tWyBYZW4tNC4x
MS11bnN0YWJsZSAgeDg2XzY0ICBkZWJ1Zz15ICAgTm90IHRhaW50ZWQgXS0tLS0KPiAoWEVOKSBD
UFU6ICAgIDAKPiAoWEVOKSBSSVA6ICAgIGUwMDg6WzxmZmZmODJkMDgwMjdjMzVkPl0gc2VhcmNo
X3ByZV9leGNlcHRpb25fdGFibGUrMC8weDU0Cj4gKFhFTikgUkZMQUdTOiAwMDAwMDAwMDAwMDEw
MDQ2ICAgQ09OVEVYVDogaHlwZXJ2aXNvcgo+IChYRU4pIHJheDogMDAwMDAwMDAwMDAwMDAwMCAg
IHJieDogMDAwMDAwMDAwMDAwMDAwMCAgIHJjeDogMDAwMDAwMDAwMDAwMDAwMAo+IChYRU4pIHJk
eDogMDAwMDAwMDAwMDAwMDAwMCAgIHJzaTogMDAwMDAwMDAwMDAwMDAwMCAgIHJkaTogZmZmZmM5
MDA0MGNkNDAyOAo+IChYRU4pIHJicDogMDAwMDM2ZmZiZjMyYmZiNyAgIHJzcDogZmZmZmM5MDA0
MGNkNDAyMCAgIHI4OiAgMDAwMDAwMDAwMDAwMDAwMAo+IChYRU4pIHI5OiAgMDAwMDAwMDAwMDAw
MDAwMCAgIHIxMDogMDAwMDAwMDAwMDAwMDAwMCAgIHIxMTogMDAwMDAwMDAwMDAwMDAwMAo+IChY
RU4pIHIxMjogMDAwMDAwMDAwMDAwMDAwMCAgIHIxMzogMDAwMDAwMDAwMDAwMDAwMCAgIHIxNDog
ZmZmZmM5MDA0MGNkN2ZmZgo+IChYRU4pIHIxNTogMDAwMDAwMDAwMDAwMDAwMCAgIGNyMDogMDAw
MDAwMDA4MDA1MDAzYiAgIGNyNDogMDAwMDAwMDAwMDA0MjZlMAo+IChYRU4pIGNyMzogMDAwMDAw
MDIyMjAwYTAwMCAgIGNyMjogZmZmZmM5MDA0MGNkM2ZmOAo+IChYRU4pIGZzYjogMDAwMDdmZDc0
NTE1ZTc0MCAgIGdzYjogZmZmZjg4MDIxZTZjMDAwMCAgIGdzczogMDAwMDAwMDAwMDAwMDAwMAo+
IChYRU4pIGRzOiAwMDJiICAgZXM6IDAwMmIgICBmczogMDAwMCAgIGdzOiAwMDAwICAgc3M6IGUw
MTAgICBjczogZTAwOAo+IChYRU4pIEN1cnJlbnQgc3RhY2sgYmFzZSBmZmZmYzkwMDQwY2QwMDAw
IGRpZmZlcnMgZnJvbSBleHBlY3RlZCBmZmZmODMwMGNlYzg4MDAwCj4gKFhFTikgVmFsaWQgc3Rh
Y2sgcmFuZ2U6IGZmZmZjOTAwNDBjZDYwMDAtZmZmZmM5MDA0MGNkODAwMCwgc3A9ZmZmZmM5MDA0
MGNkNDAyMCwgdHNzLnJzcDA9ZmZmZjgzMDBjZWM4ZmZhMAoKVGhlIGZhY3QgdGhhdCB0aGUgZXhh
Y3QgbG9jYXRpb24gdmFyaWVzIHdoZXJlIHRoZSAjREYgdHJpZ2dlcnMgaXMgb2Ygbm8gYmlnCmlu
dGVyZXN0IC0gaXQgYWxsIGRlcGVuZHMgb24gd2hlbiBleGFjdGx5IHRoZSBzdGFjayBvdmVyZmxv
dyBvY2N1cnMuIFdoYXQKSSBub3RlIHRob3VnaDogZmZmZmM5MDA0MGNkNDAyMCBpcyBhIGd1ZXN0
IChwcmVzdW1hYmx5IERvbTApIGtlcm5lbAphZGRyZXNzLCBmYXIgb3V0c2lkZSB0aGUgWGVuIHJh
bmdlLiBJIGd1ZXNzIHdlJ2QgbmVlZCB0byBzZWUgYWxsIG9mIHRoYXQKKHdyb25nKSBzdGFjaydz
IGNvbnRlbnRzIGxvZ2dlZCB1cCB0byB0aGUgb3JpZ2luYWwgZW50cnkgaW50byBYZW4gdG8KdW5k
ZXJzdGFuZCBob3cgdGhhdCBjb3VsZCBoYXZlIGhhcHBlbmVkLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
