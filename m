From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 for-4.12] gic-vgic: fix an assert
 condition
Date: Tue, 29 Jan 2019 15:34:11 +0000
Message-ID: <16c3f4fd-cbcf-570b-88c0-a67a08f19491@arm.com>
References: <1548435962-29797-1-git-send-email-andrii.anisov@gmail.com>
 <71c6093b-c805-deab-94f9-22f47821c23b@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dSfb=QF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1goVOw-0008Tv-SB
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 15:34:14 +0000
In-Reply-To: <71c6093b-c805-deab-94f9-22f47821c23b@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Stefan Nuernberger <snu@amazon.de>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyOC8wMS8yMDE5IDEyOjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDI1LzAx
LzIwMTkgMTg6MDYsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+IEZyb206IEFuZHJpaSBBbmlzb3Yg
PGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4+Cj4+IEN1cnJlbnRseSwgdGhhdCBhc3NlcnQgY29u
ZGl0aW9uIGRvZXMgbm90IGNvcnJlc3BvbmQgdG8gYSBjb21tZW50IGFib3ZlCj4+IGFuZCBtYWtl
cyBhc3NlcnRpb24gZmFpbGVkIG9uIEhXIElSUSBkaXNjb25uZWN0aW9uLgo+PiBGaXggdGhlIGNv
bmRpdGlvbiBzbyBpdCBjb3JyZXNwb25kcyB0byB0aGUgY29tbWVudCBhbmQgYWxsb3dzIElSUQo+
PiBkaXNjb25uZWN0aW9uIG9uIGRlYnVnIGJ1aWxkcy4KPj4KPj4gRml4ZXM6IGVjMmEyZjEgKCJB
Uk06IFZHSUM6IGZhY3RvciBvdXQgdmdpY19jb25uZWN0X2h3X2lycSgpIikKPj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPj4gU3VnZ2VzdGVk
LWJ5OiBTdGVmYW4gTnVlcm5iZXJnZXIgPHNudUBhbWF6b24uZGU+Cj4gCj4gUmVsZWFzZS1hY2tl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKVGhhbmsgeW91IQoKSSBoYXZl
IG5vdyBhcHBsaWVkIHRoZSBwYXRjaCB3aXRoIGEgc2xpZ2h0IHJld29yZCBpbiB0aGUgY29tbWl0
IG1lc3NhZ2U6Cgp4ZW4vYXJtOiBnaWMtdmdpYzogZml4IGFzc2VydCBjb25kaXRpb24gaW4gdmdp
Y19jb25uZWN0X2h3X2lycQoKQ3VycmVudGx5LCB0aGUgYXNzZXJ0IGNvbmRpdGlvbiBpbiB2Z2lj
X2Nvbm5lY3RfaHdfaXJxIGRvZXMgbm90IGNvcnJlc3BvbmQgdG8KdGhlIGNvbW1lbnQgYWJvdmUg
YW5kIHJlc3VsdCB0byBoaXQgdGhlIGFzc2VydGlvbiBvbiBIVyBJUlEgZGlzY29ubmVjdGlvbi4K
Rml4IHRoZSBjb25kaXRpb24gc28gaXQgY29ycmVzcG9uZHMgdG8gdGhlIGNvbW1lbnQgYW5kIGFs
bG93cyBJUlEKZGlzY29ubmVjdGlvbiBvbiBkZWJ1ZyBidWlsZHMuCgpBbmRyaWksIHBsZWFzZSB0
cnkgdG8gYWRkIHRoZSBzdWJzeXN0ZW0geW91IG1vZGlmeSBpbiB0aGUgY29tbWl0IHRpdGxlIChp
LmUgCnhlbi9hcm0pLiBUaGlzIGhlbHBzIGZvciB0aGUgcmV2aWV3ZXIgdG8ga25vdyB3aGF0IHlv
dSBhcmUgbW9kaWZ5aW5nIGFuZCBhbHNvIApoZWxwcyB3aGVuIGxvb2tpbmcgYXQgc2hvcnRsb2cu
CgpDaGVlcnMsCgo+IAo+IAo+IEp1ZXJnZW4KPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
