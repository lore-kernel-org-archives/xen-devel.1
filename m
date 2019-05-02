From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: linux 4.19 xenstore memory allocation failure Re:
 [linux-4.19 test] 135420: regressions - FAIL
Date: Thu, 2 May 2019 11:42:04 +0100
Message-ID: <23754.51580.477282.458295@mariner.uk.xensource.com>
References: <23752.18285.3998.815201@mariner.uk.xensource.com>
 <5CC85AF9020000780022A839@prv1-mh.provo.novell.com>
 <23752.23708.661076.214573@mariner.uk.xensource.com>
 <20190430155505.gqhdgxzt5ajdt65v@Air-de-Roger>
 <23753.27461.546649.855744@mariner.uk.xensource.com>
 <20190502094528.m7ir4xkabvndppyn@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yl7K=TC=citrix.com=prvs=018ff06f8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hM9AV-0004fY-7U
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 10:42:23 +0000
In-Reply-To: <20190502094528.m7ir4xkabvndppyn@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBsaW51eCA0LjE5IHhlbnN0
b3JlIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUgUmU6IFtsaW51eC00LjE5IHRlc3RdIDEzNTQy
MDogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gT24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMTA6NDc6
NDlBTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBXaGF0IGlmIHlvdSBjYW4ndCB3cml0
ZSB0byB4ZW5zdG9yZSA/ICBDYW4gd2UgYXQgbGVhc3QgaGF2ZSBhIGNvcHkgaW4KPiA+IHRoZSBr
ZXJuZWwgbG9nID8gIFRoZXJlIG1pZ2h0IGJlIG90aGVyIGVycm9ycyBiZXNpZGVzIHRoaXMgbWVt
b3J5Cj4gPiBleGhhdXN0aW9uLCBzdXJlbHkuCj4gCj4gVGhlcmUncyBhIGNhbGwgdG8gZGV2X2Vy
ciBhbHNvLCB3aGljaCBzaG91bGQgcHJpbnQgdGhlIHNhbWUgZXJyb3IKPiB0aGF0J3Mgd3JpdHRl
biB0byB4ZW5zdG9yZSBvbiB0aGUgY29uc29sZS4gVGhhdCBob3dldmVyIHJlcXVpcmVzIHRoZQo+
IG1lbW9yeSBhbGxvY2F0aW9uIG9mIHBhZ2UgaW4gb3JkZXIgdG8gZm9ybWF0IHRoZSBzdHJpbmcg
dG8gYmUgcHJpbnRlZAo+IChzZWUgeGVuYnVzX3ZhX2Rldl9lcnJvcikuCgpDYW4gd2UgYXNzdW1l
IHRoYXQgbWVtb3J5IGV4aGF1c3Rpb24gd2lsbCBhbHdheXMgcmVzdWx0IGluIHNvbWUKbWVzc2Fn
ZSBmcm9tIHRoZSBtZW1vcnkgYWxsb2NhdG9yID8gIElmIHNvIHRoZW4gdGhpcyBuZXcgbG9nIG1l
c3NhZ2UKd291bGQgYmUgYSB1c2VmdWwgYWRkaXRpb24gZm9yIGNhc2VzICpvdGhlciogdGhhbiBh
IGNvbXBsZXRlIGxhY2sgb2YKYW55IGF2YWlsYWJsZSBmcmVlIHBhZ2UuICBFZywgZm9vbGlzaGx5
IHRyeWluZyBhIGxhcmdlIGtjYWxsb2MKYWxsb2NhdGlvbiwgb3Igc29tZSBlcnJvciBub3QgcmVs
YXRlZCB0byBsYWNrIG9mIG1lbW9yeSBhdCBhbGwuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
