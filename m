From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/netfront: raise max number of slots in
 xennet_get_responses()
Date: Tue, 12 Jun 2018 08:45:30 +0200
Message-ID: <788aa6a6-3fb2-f136-6219-d69b952a55c6__14505.4306755357$1528785863$gmane$org@suse.com>
References: <20180611075742.1691-1-jgross@suse.com>
 <e970a52b-d4ad-30c1-65ca-15d7679951da@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=w5bd=i6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fSd3f-0003xB-9a
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 06:45:35 +0000
In-Reply-To: <e970a52b-d4ad-30c1-65ca-15d7679951da@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Cc: davem@davemloft.net
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDYvMTggMjA6NTksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwNi8xMS8yMDE4
IDAzOjU3IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBUaGUgbWF4IG51bWJlciBvZiBzbG90
cyB1c2VkIGluIHhlbm5ldF9nZXRfcmVzcG9uc2VzKCkgaXMgc2V0IHRvCj4+IE1BWF9TS0JfRlJB
R1MgKyAocngtPnN0YXR1cyA8PSBSWF9DT1BZX1RIUkVTSE9MRCkuCj4+Cj4+IEluIG9sZCBrZXJu
ZWwteGVuIE1BWF9TS0JfRlJBR1Mgd2FzIDE4LCB3aGlsZSBub3dhZGF5cyBpdCBpcyAxNy4gVGhp
cwo+PiBkaWZmZXJlbmNlIGlzIHJlc3VsdGluZyBpbiBmcmVxdWVudCBtZXNzYWdlcyAidG9vIG1h
bnkgc2xvdHMiIGFuZCBhCj4+IHJlZHVjZWQgbmV0d29yayB0aHJvdWdocHV0IGZvciBzb21lIHdv
cmtsb2FkcyAoZmFjdG9yIDEwIGJlbG93IHRoYXQgb2YKPj4gYSBrZXJuZWwteGVuIGJhc2VkIGd1
ZXN0KS4KPj4KPj4gUmVwbGFjaW5nIE1BWF9TS0JfRlJBR1MgYnkgWEVOX05FVElGX05SX1NMT1RT
X01JTiBmb3IgY2FsY3VsYXRpb24gb2YKPj4gdGhlIG1heCBudW1iZXIgb2Ygc2xvdHMgdG8gdXNl
IHNvbHZlcyB0aGF0IHByb2JsZW0gKHRlc3RzIHNob3dlZCBubwo+PiBtb3JlIG1lc3NhZ2VzICJ0
b28gbWFueSBzbG90cyIgYW5kIHRocm91Z2hwdXQgd2FzIGFzIGhpZ2ggYXMgd2l0aCB0aGUKPj4g
a2VybmVsLXhlbiBiYXNlZCBndWVzdCBzeXN0ZW0pLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJv
dnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gCj4gSSB3b25kZXIgYWxzbyB3aGV0
aGVyIG5ldGZyb250X3R4X3Nsb3RfYXZhaWxhYmxlKCkgaXMgbWVhbnQgdG8gYmUKPiAKPiByZXR1
cm4gKHF1ZXVlLT50eC5yZXFfcHJvZF9wdnQgLSBxdWV1ZS0+dHgucnNwX2NvbnMpIDwKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKE5FVF9UWF9SSU5HX1NJWkUgLSBYRU5fTkVUSUZf
TlJfU0xPVFNfTUlOIC0gMSk7Cj4gCj4gd2hpY2ggaXMgdGhlIHNhbWUgbnVtZXJpYyB2YWx1ZSBi
dXQgcHJvdmlkZXMgYSBtb3JlIGFjY3VyYXRlIGRlc2NyaXB0aW9uCj4gb2Ygd2hhdCBpcyBiZWlu
ZyB0ZXN0ZWQuCgpZZXMsIHRoaXMgaXMgYSBzZW5zaWJsZSBpZGVhLiBJJ2xsIGFkZCB0aGF0LCBr
ZWVwaW5nIHlvdXIgUi1iLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
