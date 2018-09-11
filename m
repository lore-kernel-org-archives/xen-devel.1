From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 1/5] xentrace_format: print timestamps in
 nanoseconds
Date: Tue, 11 Sep 2018 11:44:26 +0100
Message-ID: <2fa12bbc-ace0-c75e-96bd-431cb4d49158@citrix.com>
References: <1536597679-8303-1-git-send-email-andrii.anisov@gmail.com>
 <1536597679-8303-2-git-send-email-andrii.anisov@gmail.com>
 <3e079a5d-6437-90a4-f313-e87b57f9b2bd@citrix.com>
 <732445b5-59cf-5416-455d-f994ee2aa47c@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <732445b5-59cf-5416-455d-f994ee2aa47c@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>, Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTEvMjAxOCAxMTozMiBBTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBHZW9y
Z2UsCj4gCj4gCj4gT24gMTEuMDkuMTggMTM6MTUsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgbWh6Ogo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHNj
ID0gdHNjIC8gKG1oeioxMDAwMDAwLjApCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0c2Mg
PSB0c2MgKiAxMDAwLjAgLyBtaHoKPj4gV2h5IGRvIHlvdSBwcmVmZXIgdGhpcz8KPiBJJ20gcGxh
eWluZyB3aXRoIHNjaGVkdWxpbmcgZnJvbSBvbmUgaGFuZCwgc28gdGltZSBzdGFtcHMgaW4gc2Vj
b25kcwo+IGRvZXMgbm90IGdpdmUgdW5kZXJzdGFuZGluZyBhYm91dCB3aGF0J3MgZ29pbmcgb24u
Cj4gRnJvbSBvdGhlciBoYW5kIEknbSBxdWl0ZSBjb25mdXNlZCBhYm91dCBob3cgdXNlZnVsIHRp
bWVzdGFtcHMgaW4KPiBzZWNvbmRzIGNvdWxkIGJlIGZvciB0cmFjZXMuIEFzIHBlciBteSB1bmRl
cnN0YW5kaW5nLCB0cmFjZXIgc2hvdWxkIGJlCj4gdXNlZnVsIGZvciBkZWJ1Z2dpbmcgc29tZSBy
YXBpZGx5IGNoYW5naW5nIHByb2Nlc3Nlcy4KCk9oLCBzb3JyeSAtLSBJIG1pc3NlZCB0aGUgcG9p
bnQgb2YgdGhpcyBwYXRjaC4KCi0tLQp4ZW50cmFjZV9mb3JtYXQ6IHByaW50IHRpbWVzdGFtcHMg
aW4gbmFub3NlY29uZHMKCi4uLnJhdGhlciB0aGFuIHNlY29uZHMuICBIYXZpbmcgdGltZXN0YW1w
cyBmb3IgcmFwaWRseS1vY2N1cnJpbmcgZXZlbnRzCmluIG5hbm9zZWNvbmRzIG1ha2VzIGl0IGVh
c2llciB0byB1bmRlcnN0YW5kIHdoYXQncyBnb2luZyBvbi4KCldoaWxlIGhlcmUsIGRvY3VtZW50
IHRoZSAtYyBvcHRpb24uCi0tLQoKV2hhdCBJIGRvIGluIHhlbmFseXplIGlzIHRvIGhhdmUgdGhl
IHRpbWVzdGFtcHMgaW4gc2Vjb25kcywgYnV0IGFsd2F5cwpwcmludCBkb3duIHRvIHRoZSBuYW5v
c2Vjb25kLiAgKEZvciB0aGlzIEkgYWN0dWFsbHkgYnJlYWsgY3B1IGN5Y2xlcwppbnRvIHMgYW5k
IG5zIHNlcGFyYXRlbHksIGFuZCB0aGVuIHByaW50ICIldS4lMDl1Ii4pCgpCdXQgdGhpcyBpcyBh
bHNvIGZpbmUgd2l0aCBtZS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
