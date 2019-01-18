From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 0/2] add xl command to get hypervisor .config
Date: Fri, 18 Jan 2019 11:38:46 +0000
Message-ID: <4fff6efe-1b46-674e-42b6-e4206453351b@citrix.com>
References: <20190117145722.30311-1-jgross@suse.com>
 <17598871-31d9-2d79-f5f4-2cce3d9e9f56@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m1QX=P2=citrix.com=prvs=914c89528=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gkSV6-0002fJ-G9
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 11:39:52 +0000
In-Reply-To: <17598871-31d9-2d79-f5f4-2cce3d9e9f56@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMS8xNy8xOSAzOjIzIFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDE3LzAxLzIwMTkg
MTU6NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFkZCAieGwgZ2V0LWNvbmZpZyIgcHJpbnRp
bmcgdGhlIC5jb25maWcgdXNlZCB0byBidWlsZCB0aGUgY3VycmVudGx5Cj4+IHJ1bm5pbmcgaHlw
ZXJ2aXNvci4KPiAKPiBCVFc6IEknZCBsaWtlIHRvIGhhdmUgZmVlZGJhY2sgZXNwZWNpYWxseSBp
ZiBzb21lb25lIHRoaW5rcyB0aGlzIHNlcmllcwo+IHNob3VsZCBieSBhbnkgbWVhbnMgYmUgcGFy
dCBvZiA0LjEyLiBJZiBub3QgSSdsbCBzZW5kIG91dCBWMiB3aXRoCj4gYnVtcGluZyB0aGUgc3lz
Y3RsIGludGVyZmFjZSB2ZXJzaW9uLgoKSWYgc29tZW9uZSAqZWxzZSogd291bGQgaGF2ZSBzZW5k
IHRoaXMgaW5zdGVhZCBvZiB5b3UsIHdvdWxkIHlvdSBoYXZlCmNvbnNpZGVyZWQgaW5jbHVkaW5n
IGl0LCBvciB3b3VsZCB5b3UgaGF2ZSBzYWlkIHRoYXQgdGhpcyBpcyB3YXkgcGFzdAp0aGUgImZl
YXR1cmUgZnJlZXplIiBpbiBtaWQtRGVjZW1iZXIsIGl0IHdpbGwgYmUganVzdCBmaW5lIHRvIHdh
aXQgdW50aWwKNC4xMz8KCklmIHRoZSBhbnN3ZXIgaXMgInllcyIsIHRoZW4gaXQgYmVncyB0aGUg
cXVlc3Rpb24gd2hhdCB0aGUgcG9pbnQgb2YgdGhlCmZlYXR1cmUgZnJlZXplIGlzLCBpZiBuZXcg
ZmVhdHVyZXMgY2FuIGJlIGludHJvZHVjZWQgYWZ0ZXIgdGhlICpjb2RlCmZyZWV6ZSouCgpJZiB0
aGUgYW5zd2VyIGlzICJubyIsIHRoZW4geW91J3JlIGJhc2ljYWxseSBhYnVzaW5nIHlvdXIgcG9z
aXRpb24gYXMKcmVsZWFzZSBtYW5hZ2VyIHRvIGdldCB5b3VyIG93biBjb2RlIGluLgoKKkV2ZXJ5
b25lKiB0aGlua3MgdGhhdCB0aGVpciBvd24gcGF0Y2ggaXMgc3VwZXItaW1wb3J0YW50IHRvIGdl
dCBpbgpiZWZvcmUgdGhlIG5leHQgcmVsZWFzZSwgYW5kIGJhc2ljYWxseSBwZXJmZWN0IGFuZCBu
b3QgZ29pbmcgdG8gY2F1c2UKYW55IHJlZ3Jlc3Npb25zLiAgSXQncyB0aGUgam9iIG9mIGEgcmVs
ZWFzZSBtYW5hZ2VyIHRvIGJlIHRoZSAiYmFkIGd1eSIKYW5kIHRlbGwgdGhlbSBubzsgYW5kIGEg
cmVsZWFzZSBtYW5hZ2VyIHNob3VsZCBiZSBzdHJpY3RlciB3aXRoCnRoZW1zZWx2ZXMgdGhhbiB3
aXRoIGFueWJvZHkgZWxzZS4KCiAgLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
