From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 3/8] tools: xencall, xengnttab,
 xengntshr: Provide access to internal fds
Date: Thu, 5 Jul 2018 09:49:52 +0200
Message-ID: <20180705074952.6jl56gbr3nlkirx4@mac.bytemobile.com>
References: <1528726404-14924-1-git-send-email-ian.jackson@eu.citrix.com>
 <23356.62798.870042.616000@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mmhi=jv=citrix.com=prvs=71735ed96=roger.pau@srs-us1.protection.inumbo.net>)
 id 1faz1g-00054U-Nm
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 07:50:04 +0000
Content-Disposition: inline
In-Reply-To: <23356.62798.870042.616000@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMDQsIDIwMTggYXQgMDU6MjY6NTRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSWFuIEphY2tzb24gd3JpdGVzICgiW1BBVENIIGZvci00LjEyIHYyIDAvOF0gdG9vbHM6
IERlcHJpdiBmZCBjaGVja2luZywgaW50ZXJuYWwgZmQgYWNjZXNzIik6Cj4gPiBUaGlzIHNlcmll
cyBwcm92aWRlcyB0aGUgc3VwcG9ydCBpbiB4ZW4uZ2l0IGZvciBhdWRpdGluZyB3aGV0aGVyIHFl
bXUKPiA+IGZpbGUgZGVzY3JpcHRvcnMgYXJlIGRlcHJpdmlsZWdlZCwgYXMgZXhwZWN0ZWQgd2l0
aCBsaWJ4bAo+ID4gZG1fcmVzdHJpY3Q9MS4KPiAKPiBUaGVzZSB3ZXJlIGFsbCBhY2tlZC4KPiAK
PiBIb3dldmVyLCBvbiByZWJhc2luZyB0byBjdXJyZW50IHN0YWdpbmcgSSBoYWQgYSBtZXJnZSBj
b25mbGljdCBpbgo+IGxpYnhlbmdudHRhYi5tYXAuICBIZXJlIGlzIHRoZSBuZXcgdmVyc2lvbiwg
dGhlcmVmb3JlLCB3aXRoIFJvZ2VyJ3MKPiBSLUIgYW5kIFdlaSdzIEEtQiBkcm9wcGVkIGZvciB0
aGF0IHJlYXNvbi4KPiAKPiBUaGFua3MsCj4gSWFuLgo+IAo+IEZyb20gZjYxZTZlZTFhMmE2NTMw
ZGFiYzE1ZWVmODY4NDUyMTBkMTRhYTUzYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiBGcm9t
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBEYXRlOiBGcmksIDQg
TWF5IDIwMTggMTY6Mjk6MTcgKzAxMDAKPiBTdWJqZWN0OiBbUEFUQ0ggdjQgMy84XSB0b29sczog
eGVuY2FsbCwgeGVuZ250dGFiLCB4ZW5nbnRzaHI6IFByb3ZpZGUgYWNjZXNzCj4gIHRvIGludGVy
bmFsIGZkcwo+IE1JTUUtVmVyc2lvbjogMS4wCj4gQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PVVURi04Cj4gQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+IAo+IEkgd2Fu
dCB0aGlzIHRvIHN1cHBvcnQgbXkgcWVtdSBkZXByaXYgZGVzY3JpcHRvciBhdWRpdCB0b29sLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29t
Pgo+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3
ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
