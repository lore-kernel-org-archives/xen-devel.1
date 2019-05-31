From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86: further speed-up to hweight{32,
 64}()
Date: Fri, 31 May 2019 12:23:27 -0700
Message-ID: <097ab8e6-8c76-f7c6-d992-09d1b38b3f44@citrix.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9770200007800233E04@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWpjv-0004fB-Td
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 22:11:07 +0000
In-Reply-To: <5CF0F9770200007800233E04@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMjAxOSAwMjo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQWNjb3JkaW5nIHRvIExp
bnV4IGNvbW1pdCAwMTM2NjExYzYyICgib3B0aW1pemUgaHdlaWdodDY0IGZvciB4ODZfNjQiKQo+
IHRoaXMgaXMgYSBmdXJ0aGVyIGltcHJvdmVtZW50IG92ZXIgdGhlIHZhcmlhbnQgdXNpbmcgb25s
eSBiaXR3aXNlCj4gb3BlcmF0aW9ucy4gSXQncyBhbHNvIGEgc2xpZ2h0IGZ1cnRoZXIgY29kZSBz
aXplIHJlZHVjdGlvbi4KPgo+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpUaGlzIHNob3VsZCBhbHNvIGluY2x1ZGUgQVJNNjQsIHdoaWNoIGFsc28gdW5j
b25kaXRpb25hbGx5IHNlbGVjdHMKSEFTX0ZBU1RfTVVMVElQTFkgaW4gTGludXguCgpBcyBmb3Ig
dGhlIHg4NiBzaWRlIG9mIHRoaW5ncywgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIKPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cgo+Cj4gLS0tIGEveGVuL2FyY2gveDg2L0tjb25maWcKPiArKysg
Yi94ZW4vYXJjaC94ODYvS2NvbmZpZwo+IEBAIC0xMiw2ICsxMiw3IEBAIGNvbmZpZyBYODYKPiAg
CXNlbGVjdCBIQVNfQ1BVRlJFUQo+ICAJc2VsZWN0IEhBU19FSENJCj4gIAlzZWxlY3QgSEFTX0VY
X1RBQkxFCj4gKwlzZWxlY3QgSEFTX0ZBU1RfTVVMVElQTFkKPiAgCXNlbGVjdCBIQVNfR0RCU1gK
PiAgCXNlbGVjdCBIQVNfSU9QT1JUUwo+ICAJc2VsZWN0IEhBU19LRVhFQwo+Cj4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
