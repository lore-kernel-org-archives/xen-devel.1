From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [xen-unstable baseline-only test] 74980:
 regressions - FAIL
Date: Tue, 17 Jul 2018 21:55:45 +0100
Message-ID: <51f4017f-1345-1e3f-c1a7-cfc0440b18b9@citrix.com>
References: <osstest-74980-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h9ca=kb=citrix.com=prvs=729a6f093=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ffX0f-0001SH-Fe
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 20:55:49 +0000
In-Reply-To: <osstest-74980-mainreport@xen.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Platform Team regression test user <citrix-osstest@xenproject.org>, xen-devel@lists.xenproject.org, osstest-admin@xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDcvMTggMjA6MTEsIFBsYXRmb3JtIFRlYW0gcmVncmVzc2lvbiB0ZXN0IHVzZXIgd3Jv
dGU6Cj4gVGhpcyBydW4gaXMgY29uZmlndXJlZCBmb3IgYmFzZWxpbmUgdGVzdHMgb25seS4KPgo+
IGZsaWdodCA3NDk4MCB4ZW4tdW5zdGFibGUgcmVhbCBbcmVhbF0KPiBodHRwOi8vb3NzdGVzdC54
cy5jaXRyaXRlLm5ldC9+b3NzdGVzdC90ZXN0bG9ncy9sb2dzLzc0OTgwLwo+Cj4gUmVncmVzc2lv
bnMgOi0oCj4KPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywK
PiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC14dGYtYW1k
NjQtYW1kNjQtMiAgICAgICA2MyB4dGYvdGVzdC1odm02NC14c2EtMjA0ICAgIGZhaWwgUkVHUi4g
dnMuIDc0OTcxCgpUaGlzIGZhaWx1cmUgaXMgYml6YXJyZS7CoCBUaGUgWFNBLTIwNCBQb0MgZG9l
cyBhbiBlbXVsYXRlZCBzeXNjYWxsCmluc3RydWN0aW9uLCBidXQgdGhlIGNyYXNoIGhlcmUgaXMg
d2hlbiBleGVjdXRpbmcgc3lzcmV0cSB0byBleGl0IGZyb20KdGhlIHN5c2NhbGwgaGFuZGxlci4K
CkZyb20gdGhlIFhlbiBib290IGxvZywgdGhpcyBpcyBhIFBlbnJ5biBzeXN0ZW0uwqAgSXQgaXMg
NjRiaXQgc28gc2hvdWxkCmhhdmUgbm8gcHJvYmxlbXMgd2l0aCBzeXNjYWxsL3N5c3JldC7CoCBJ
IHNlZSB0aGF0IHRoZSB1Y29kZSBpcyBmcm9tIDIwMTAKc28gZ2V0dGluZyBvbiBmb3IgOCB5ZWFy
cyBvdXQgb2YgZGF0ZQoKT1RPSCwgSSBzZWUgZnJvbSB0aGUgc2VyaWFsIGxvZwoKPiBKdWwgMTcg
MjE6NDc6MDQuODYwMDg5IFvCoCA0MzcuMTk1MzE2XSBJUHY2OiBBRERSQ09ORihORVRERVZfVVAp
Ogo+IHZpZjEuMDogbGluayBpcyBub3QgcmVhZHkgwqAKPiBKdWwgMTcgMjE6NDc6MDQuODYwMTI3
IChYRU4pIGQxdjAgdm1lbnRyeSBmYWlsdXJlIChyZWFzb24gMHg4MDAwMDAyMik6Cj4gTVNSIGxv
YWRpbmcgKGVudHJ5IDApCj4gSnVsIDE3IDIxOjQ3OjA1LjE2NDA2OSAoWEVOKcKgwqAgbXNyIGMw
MDAwMDgwIHZhbCAwMDAwMDAwMDAwMDAwODAxIChtYnogMCkKPiBKdWwgMTcgMjE6NDc6MDUuMTcy
MDQ0IChYRU4pICoqKioqKioqKioqKiogVk1DUyBBcmVhICoqKioqKioqKioqKioqwqAKCldoaWNo
IGlzIHN1cmVseSBjYXVzaW5nIGFsbCBIVk0gZ3Vlc3RzIHRvIGZhaWwsIGJ1dCBkb2Vzbid0IGFw
cGVhciBzbwpmcm9tIHRoZSBvdGhlciByZXN1bHRzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
