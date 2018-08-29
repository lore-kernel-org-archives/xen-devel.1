From: "Jan Beulich" <JBeulich@suse.com>
Subject: 4.10.2 preparations
Date: Wed, 29 Aug 2018 00:51:08 -0600
Message-ID: <5B86425C02000078001E2D6E@prv1-mh.provo.novell.com>
References: <5B3CA46202000078001D0F7F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lc6w=lm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuuJs-0002I0-4y
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 06:51:12 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: anthony.perard@citrix.com, Ian Jackson <Ian.Jackson@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Lars Kurth <lars.kurth@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

QWxsLAoKc3RyaWN0bHkgc3BlYWtpbmcgdGhpcyBpcyBzdXBwb3NlZCB0byBnbyBvdXQgaW4gYWJv
dXQgYSB3ZWVrcyB0aW1lLiBXaXRoCjQuOS4zIGJsb2NrZWQgYnkgYW4gb3NzdGVzdCBmYWlsdXJl
LCBJJ20gbm93IGludGVuZGluZyB0byBjdXQgYm90aCBzdGFibGUKdmVyc2lvbnMgYXQgdGhlIHNh
bWUgdGltZS4gU2luY2UgZnJvbSBteSBwcmVsaW1pbmFyeSBhbmFseXNpcyBpdCBpcyBvbmx5CmEg
bWF0dGVyIG9mIHRpbWUgZm9yIG90aGVyIHN0YWJsZSBicmFuY2hlcyB0byBhbHNvIGdldCBzdHVj
ayB0aGlzIHNhbWUKd2F5LCBJJ20gaW4gcGFydGljdWxhciBub3QgbWVhbmluZyBmb3IgNC4xMC4y
IHRvIGdvIG91dCBlYXJsaWVyIHRoYW4KNC45LjMsIGkuZS4gbm90IGJlZm9yZSB0aGF0IG9zc3Rl
c3QgaXNzdWUgaXMgdW5kZXIgY29udHJvbC4KClBsZWFzZSBwb2ludCBvdXQgYmFja3BvcnQgY2Fu
ZGlkYXRlcyB5b3UgZmluZCBtaXNzaW5nIGZyb20gaXRzIHN0YWdpbmcKYnJhbmNoLCBidXQgd2hp
Y2ggeW91IGNvbnNpZGVyIHJlbGV2YW50LiBJIGhhdmUgYSBmZXcgbW9yZSBjb21taXRzCnF1ZXVl
ZCBhbHJlYWR5IGZvciBiYWNrcG9ydGluZzoKCjQ4ZGJiMmRiZTkgeDg2L3ZteDogQXZvaWQgaGl0
dGluZyBCVUdfT04oKSBhZnRlciBFUFRQLXJlbGF0ZWQgZG9tYWluX2NyYXNoKCkKYjZmNDNjMTRj
ZSB4ODYvdmxhcGljOiBCdWdmaXhlcyBhbmQgaW1wcm92ZW1lbnRzIHRvIHZsYXBpY197cmVhZCx3
cml0ZX0oKQo2MGE1NmRjMDA2IHg4Ni9odm0vaW9yZXE6IE1NSU8gcmFuZ2UgY2hlY2tpbmcgY29t
cGxldGVseSBpZ25vcmVzIGRpcmVjdGlvbiBmbGFnCjNlNGVjMDdlMTQgeDg2L3NldHVwOiBBdm9p
ZCBPb0IgRTgyMCBsb29rdXAgd2hlbiBjYWxjdWxhdGluZyB0aGUgTDFURiBzYWZlIGFkZHJlc3MK
MGZiMGRlOGIyNCB4ODYvSFZNOiBjb3JyZWN0IGFuIGludmVydGVkIGNoZWNrIGluIGh2bV9sb2Fk
KCkKYWQwYTlmMjczZCByYW5nZXNldDogbWFrZSBpbnF1aXJ5IGZ1bmN0aW9ucyB0b2xlcmF0ZSBO
VUxMIGlucHV0cwpmZDA3YjY2NDhjIFZULWQvZG1hcjogaW9tbXUgbWVtIGxlYWsgZml4CgpUaGVy
ZWZvcmUgdGhlcmUncyBubyBuZWVkIHRvIHJlcXVlc3QgYW55IG9mIHRob3NlIGV4cGxpY2l0bHku
CgpKYW4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
