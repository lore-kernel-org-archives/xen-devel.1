From: Julien Grall <julien.grall@arm.com>
Subject: Re: ARM: Issues while Enabling hibernation in
 domU(linux) on jacinto-j6
Date: Thu, 14 Jun 2018 11:39:30 +0100
Message-ID: <45be7595-0dd5-c594-8cff-f9567fca502a@arm.com>
References: <CAN_ATrdKSqxS31CuPqoCV_pz6mp0-Le30x=yDZVanK+ZvW8noQ@mail.gmail.com>
 <498efb7e-755b-0917-6b0c-1fff257a06b6@arm.com>
 <CAN_ATreAFYS2KUZ+FLv8ykzjQbw=yoOvsZ5PwSChmubd9ky_HA@mail.gmail.com>
 <4e1b355d-43aa-336d-8d90-e83d97a409c0@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=iotm=ja=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fTPfC-0002YH-0a
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 10:39:34 +0000
In-Reply-To: <4e1b355d-43aa-336d-8d90-e83d97a409c0@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: moin anjnawala <moinanjnawala@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Omkar Bolla <omkar062@gmail.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

UmVwbHlpbmcgdG8gbXlzZWxmLgoKT24gMDYvMDYvMTggMTk6MDAsIEp1bGllbiBHcmFsbCB3cm90
ZToKPiBPbiAwNi8wNi8xOCAwOToxNywgbW9pbiBhbmpuYXdhbGEgd3JvdGU6Cj4+IENhbiB5b3Ug
cG9pbnQgbWUgdG93YXJkcyB3aGF0IGNvdWxkIGJlIHRoZSBpc3N1ZSA/IElmIGFueSBvdGhlcgo+
PiBpbmZvcm1hdGlvbiBpcyBuZWVkZWQgdGhlbiBJIGNhbiBwcm92aWRlIGl0IHRvIHlvdS4KPiAK
PiBMb29raW5nIGF0IHRoZSBsb2cgYW5kIExpbnV4IDQuMTcsIG5vbmUgb2YgdGhlIFBWIGRyaXZl
cnMgc2VlbSB0byBoYXZlIAo+IHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNrLiBUaGlzIG1pZ2h0IGJl
IHRoZSByZWFzb24gb2YgdGhlIGNyYXNoIGFzIGZyb20gCj4gWGVuIFBvViB0aGlzIGlzIGEgbmV3
IGd1ZXN0IHNvIHRoZSBtZW1vcnkgYW5kIGV2ZW50IGNoYW5uZWwgaGF2ZSBub3QgCj4gYmVlbiBj
b25maWd1cmVkLiBUaGUgZ3Vlc3Qgc2hvdWxkIHJlYWxseSBkbyBpdCBhZ2Fpbi4KPiAKPiBJdCBs
b29rcyBsaWtlIHRoZXJlIGFyZSBzb21lIGNvZGUgaW4gZHJpdmVycy94ZW4vbWFuYWdlLmMgdG8g
aGFuZGxlIAo+IHN1c3BlbmQgcmVxdWVzdCBmcm9tIHRoZSB0b29sc3RhY2suIEkgYW0gbm90IGVu
dGlyZWx5IHN1cmUgd2h5IHdlIG5lZWQgCj4gb3VyIG93biB3YXkgdG8gc3VzcGVuZCBhbmQgbm90
IHJlLXVzZWQgdGhlIExpbnV4IG9uZS4KPiAKPiBKdXJnZW4sIEJvcmlzLCBkbyB5b3Uga25vdyBp
ZiBzdXNwZW5kLXRvLWRpc2sgZnJvbSB0aGUgZ3Vlc3QgY29uc29sZSAKPiB3b3JrcyBvbiB4ODY/
CgpJdCBsb29rcyBsaWtlIGl0IHdhcyBub3Qgc3VwcG9ydGVkLiBBbWF6b24gcmVjZW50bHkgc2Vu
dCBhbiBSRkMgdG8gCnN1cHBvcnQgaXQgKHNlZSBbMV0pLiBUaGlzIHNlZW1zIHRvIGhhdmUgc29t
ZSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgY29kZSAKYnV0IG9ubHkgZm9yIHg4Ni4gQXJtIGJpdHMg
d291bGQgbmVlZCB0byBiZSBpbXBsZW1lbnRlZC4KCkNoZWVycywKClsxXSAKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA2L21zZzAwODIz
Lmh0bWwKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
