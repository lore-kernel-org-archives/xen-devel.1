From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 08/14] x86emul: add read-modify-write hook
Date: Thu, 15 Mar 2018 14:19:56 +0000
Message-ID: <485afda7-5918-2bfc-2bf4-c07b06d194de@citrix.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7E7102000078001B228B@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h5rp=gf=citrix.com=prvs=605c7d53e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewToZ-00042y-2e
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 14:25:07 +0000
In-Reply-To: <5AAA7E7102000078001B228B@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMTggMTM6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC04NTE3LDYgKzg2OTAs
MTQyIEBAIHg4Nl9lbXVsYXRlKAo+ICAjdW5kZWYgdmV4Cj4gICN1bmRlZiBlYQo+ICAKPiAraW50
IHg4Nl9lbXVsX3JtdygKPiArICAgIHZvaWQgKnB0ciwKPiArICAgIHVuc2lnbmVkIGludCBieXRl
cywKPiArICAgIHVpbnQzMl90ICplZmxhZ3MsCj4gKyAgICBzdHJ1Y3QgeDg2X2VtdWxhdGVfc3Rh
dGUgKnN0YXRlLAo+ICsgICAgc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQpCj4gK3sKPiAr
ICAgIHVuc2lnbmVkIGxvbmcgKmRzdCA9IHB0cjsKPiArCj4gKyAgICBBU1NFUlQoYnl0ZXMgPT0g
c3RhdGUtPm9wX2J5dGVzKTsKPiArCj4gKyNpZmRlZiBfX3g4Nl82NF9fCj4gKyMgZGVmaW5lIEpD
WFogImpyY3h6Igo+ICsjZWxzZQo+ICsjIGRlZmluZSBKQ1haICJqZWN4eiIKPiArI2VuZGlmCj4g
Kwo+ICsjZGVmaW5lIENPTkRfTE9DSyhvcCkgXAo+ICsgICAgSkNYWiAiIC5MIiAjb3AgIiU9XG5c
dCIgXAo+ICsgICAgImxvY2tcbiIgXAo+ICsgICAgIi5MIiAjb3AgIiU9OlxuXHQiIFwKPiArICAg
ICNvcAoKSSdkIGZvcmdvdHRlbiB0aGF0IHRoZXNlIGVuY29kaW5nIG9mIGptcCBleGlzdGVkLCBi
dXQgdmFyaW91cyBPUk1zCnN1Z2dlc3QgdGhhdCBpdCBpcyBmYXIgc2xvd2VyIHRvIGV4ZWN1dGUg
dGhhbiBvdGhlciBqdW1wcy4KCklycmVzcGVjdGl2ZSBvZiB0aGUgaW5zdHJ1Y3Rpb24gbGF0ZW5j
eSBhcmd1bWVudCwgeW91J2xsIGdldCBiZXR0ZXIgY29kZQpnZW5lcmF0aW9uIHdpdGggY29uZF9v
cCgpIGxvb2tpbmcgcmF0aGVyIG1vcmUgbGlrZToKCmNtcGIgJDAsICVbbG9ja10KamUgMWYKbG9j
awoxOiAjb3AKCndoaWNoIHdpbGwgbW9zdCBsaWtlbHkgY2F1c2UgdGhlIGNtcCB0byBiZSBlbmNv
ZGVkIHdpdGggYSBtZW1vcnkKb3BlcmFuZCwgcmF0aGVyIHRoYW4gZm9yY2luZyBpdCB0aGUgdmFs
dWUgaW50byAlZWN4LgoKRXZlcnl0aGluZyBlbHNlIGxvb2tzIG9rLCBzbyBhIHByb3Zpc2lvbmFs
IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyCjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiBpZiB5
b3UgY2hvb3NlIHRvIGZvbGxvdyB0aGlzIHBhdHRlcm4uCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
