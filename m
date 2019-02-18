From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12 V5 1/2] altp2m: Prevent deadlocks
 when a domain performs altp2m operations on itself
Date: Mon, 18 Feb 2019 12:43:06 +0100
Message-ID: <082f2b3b-c95f-6597-d425-3df5da890d87@suse.com>
References: <1550245284-9321-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gvhKJ-0003pv-Mr
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 11:43:11 +0000
In-Reply-To: <1550245284-9321-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMjAxOSAxNjo0MSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IGRvbWFpbl9wYXVz
ZV9leGNlcHRfc2VsZigpIHdhcyBpbnRyb2R1Y2VkIHRvIGFsbG93IGEgZG9tYWluIHRvIHBhdXNl
Cj4gaXRzZWxmIHdoaWxlIGRvaW5nIGFsdHAybSBvcGVyYXRpb25zLiAgSG93ZXZlciwgYXMgd3Jp
dHRlbiwgaXQgaGFzIGEKPiByaXNrIGZvIGRlYWRsb2NrIGlmIHR3byB2Y3B1cyBlbnRlciB0aGUg
bG9vcCBhdCB0aGUgc2FtZSB0aW1lLgo+IAo+IEx1Y2tpbHksIHRoZXJlJ3MgYWxyZWFkeSBhIHNv
bHV0aW9uIGZvciB0aGlzOiBBdHRlbXB0IHRvIGNhbGwgZG9tYWluJ3MKPiBoeXBlcmNhbGxfZGVh
ZGxvY2tfbXV0ZXgsIGFuZCByZXN0YXJ0IHRoZSBlbnRpcmUgaHlwZXJjYWxsIGlmIHlvdQo+IGZh
aWwuCj4gCj4gTWFrZSBkb21haW5fcGF1c2VfZXhjZXB0X3NlbGYoKSBhdHRlbXB0IHRvIGdyYWIg
dGhpcyBtdXRleCB3aGVuCj4gcGF1c2luZyBpdHNlbGYsIHJldHVybmluZyAtRVJFU1RBUlQgaWYg
aXQgZmFpbHMuICBIYXZlIHRoZSBjYWxsZXJzCj4gY2hlY2sgZm9yIGVycm9ycyBhbmQgcGFzcyB0
aGUgdmFsdWUgdXAuICBJbiBib3RoIGNhc2VzLCB0aGUgdG9wLWxldmVsCj4gZG9faHZtX29wKCkg
c2hvdWxkIERUUlQgd2hlbiAtRVJFU1RBUlQgaXMgcmV0dXJuZWQuCj4gCj4gVGhlIChuZWNlc3Nh
cnkpIHJldXNlIG9mIHRoZSBoeXBlcmNhbGwgZGVhZGxvY2sgbXV0ZXggcG9zZXMgdGhlIHJpc2sK
PiBvZiBnZXR0aW5nIGNhbGxlZCBmcm9tIGEgY29udGV4dCB3aGVyZSB0aGUgbG9jayB3YXMgYWxy
ZWFkeSBhY3F1aXJlZAo+IChlLmcuIHNvbWVvbmUgbWF5IChzYXkpIGNhbGwgZG9tY3RsX2xvY2so
KSwgdGhlbiBhZnRlcndhcmRzIGNhbGwKPiBkb21haW5fcGF1c2VfZXhjZXB0X3NlbGYoKSkuIEhv
d2V2ZXIsIGluIHRoZSBpbnRlcmVzdCBvZiBub3QKPiBvdmVyY29tcGxpY2F0aW5nIHRoaW5ncywg
bm8gY2hhbmdlcyBhcmUgbWFkZSBoZXJlIHRvIHRoZSBtdXRleC4KPiBBdHRlbXB0ZWQgbmVzdGlu
ZyBvZiB0aGlzIGxvY2sgaXNuJ3QgYSBzZWN1cml0eSBpc3N1ZSwgYmVjYXVzZSBhbGwKPiB0aGF0
IHdpbGwgaGFwcGVuIGlzIHRoYXQgdGhlIHZjcHUgd2lsbCBsaXZlbG9jayB0YWtpbmcgY29udGlu
dWF0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+Cj4gVGVzdGVkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRk
ZWZlbmRlci5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
