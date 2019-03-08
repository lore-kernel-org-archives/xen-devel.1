From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v11 5/9] xen/x86: use DECLARE_BOUNDS as
 required
Date: Fri, 8 Mar 2019 15:43:41 +0000
Message-ID: <23682.36269.293104.579380@mariner.uk.xensource.com>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-5-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DpA2=RL=citrix.com=prvs=963cf6c57=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1h2Hf6-0008VP-Cx
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 15:43:52 +0000
In-Reply-To: <1551825512-8975-5-git-send-email-sstabellini@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "JBeulich@suse.com" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIltQQVRDSCB2MTEgNS85XSB4ZW4veDg2OiB1c2Ug
REVDTEFSRV9CT1VORFMgYXMgcmVxdWlyZWQiKToKPiBVc2UgREVDTEFSRV9CT1VORFMgYW5kIHRo
ZSB0d28gc3RhdGljIGlubGluZSBmdW5jdGlvbnMgdGhhdCBjb21lIHdpdGggaXQKPiBmb3IgY29t
cGFyaXNvbnMgYW5kIHN1YnRyYWN0aW9ucyBvZjoKPiAKPiBfXzJNX3J3ZGF0YV9zdGFydCwgX18y
TV9yd2RhdGFfZW5kLCBfX2VuZF92cGNpX2FycmF5LAo+IF9fc3RhcnRfdnBjaV9hcnJheSwgX3N0
ZXh0ZW50cnksIF9ldGV4dGVudHJ5LCBfX3RyYW1wb2xpbmVfcmVsX3N0YXJ0LAo+IF9fdHJhbXBv
bGluZV9yZWxfc3RvcCwgX190cmFtcG9saW5lX3NlZ19zdGFydCwgX190cmFtcG9saW5lX3NlZ19z
dG9wCj4gX19wZXJfY3B1X3N0YXJ0LCBfX3Blcl9jcHVfZGF0YV9lbmQKPiAKPiBwb3NzaWJsZSB0
byB1c2UgdGhlIHByb3ZpZGVkIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb25zLgo+IE0zQ006IFJ1bGUt
MTguMjogU3VidHJhY3Rpb24gYmV0d2VlbiBwb2ludGVycyBzaGFsbCBvbmx5IGJlIGFwcGxpZWQg
dG8KPiBwb2ludGVycyB0aGF0IGFkZHJlc3MgZWxlbWVudHMgb2YgdGhlIHNhbWUgYXJyYXkuCgpI
aS4gIEkgcGlja2VkIG9uZSBvZiB0aGVzZSB0byBicmllZmx5IGxvb2sgYXQgdGhlIGRldGFpbCBv
ZiBhbmQgSQpzcG90dGVkIHRoaXM6Cgo+IEBAIC00OSw3ICs1MCw3IEBAIHN0YXRpYyB2b2lkIF9m
cmVlX3BlcmNwdV9hcmVhKHN0cnVjdCByY3VfaGVhZCAqaGVhZCkKPiAgewo+ICAgICAgc3RydWN0
IGZyZWVfaW5mbyAqaW5mbyA9IGNvbnRhaW5lcl9vZihoZWFkLCBzdHJ1Y3QgZnJlZV9pbmZvLCBy
Y3UpOwo+ICAgICAgdW5zaWduZWQgaW50IGNwdSA9IGluZm8tPmNwdTsKPiAtICAgIGNoYXIgKnAg
PSBfX3Blcl9jcHVfc3RhcnQgKyBfX3Blcl9jcHVfb2Zmc2V0W2NwdV07Cj4gKyAgICBjaGFyICpw
ID0gKGNoYXIgKilfX3Blcl9jcHVfc3RhcnQgKyBfX3Blcl9jcHVfb2Zmc2V0W2NwdV07CgpUaGlz
IGlzIGRhbmdlcm91cyBiZWNhdXNlIGl0IHR1cm5zIF9fcGVyX2NwdV9zdGFydCB3aGljaCBpcyBh
IG1hZ2ljCmxpbmtlciBzeW1ib2wgcG9pbnRlciBpbnRvIG9uZSB3aGljaCB5b3UgbWlnaHQgdHJ5
IHRvIGNvbXBhcmUgd2l0aApvdGhlciBwb2ludGVycy4KCkkgY2FuJ3Qgc2VlIGZyb20geW91ciBw
YXRjaCB3aGF0IGVsc2UgaXMgZG9uZSB0byBgcCcuICBTb21ldGhpbmcgb3VnaHQKdG8gYmUgZG9u
ZSB0byBwcmV2ZW50IGZ1dHVyZSBwcm9ncmFtbWVycyBmcm9tIGNvbXBhcmluZyBwIHRvIG90aGVy
CnBvaW50ZXJzLgoKU29tZSBleHRlbmRlZCBjb21tZW50LCBvciBzb21ldGhpbmcsIGlzIGxpa2Vs
eSB0byBiZSBuZWVkZWQgZXZlcnkgdGltZQp5b3UgaW50cm9kdWNlIGEgY2FzdC4KCj4gICAgICBm
cmVlX3hlbmhlYXBfcGFnZXMocCwgUEVSQ1BVX09SREVSKTsKCkpPT0ksIHdoeSBkb2VzIGZyZWVf
eGVuaGVhcF9wYWdlcyBub3QgdGFrZSBhIHZvaWQqID8KClRoYW5rcywKSWFuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
