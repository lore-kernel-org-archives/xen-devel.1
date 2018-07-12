From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/3] xen/compiler: introduce a define for
 weak symbols
Date: Thu, 12 Jul 2018 05:54:18 -0600
Message-ID: <5B47416A02000078001D3798@prv1-mh.provo.novell.com>
References: <20180711153450.83331-1-roger.pau@citrix.com>
 <20180711153450.83331-3-roger.pau@citrix.com>
 <820e7ba0-ae0a-31c5-6d31-07ed3c9b8288@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sl20=j4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdaAv-0001M4-7D
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 11:54:21 +0000
In-Reply-To: <820e7ba0-ae0a-31c5-6d31-07ed3c9b8288@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Daniel Kiper <daniel.kiper@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA3LjE4IGF0IDEzOjM3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDcvMTggMTY6MzQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4gQW5kIHJl
cGxhY2UgdGhlIG9wZW4tY29kZWQgdmVyc2lvbnMgYWxyZWFkeSBpbiB0cmVlLiBObyBmdW5jdGlv
bmFsCj4+IGNoYW5nZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4+IC0tLQo+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Pj4gQ2M6IERhbmllbCBLaXBlciA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+Cj4+IC0tLQo+PiAg
eGVuL2luY2x1ZGUveGVuL2NvbXBpbGVyLmggICAgICAgICAgfCAyICsrCj4+ICB4ZW4vaW5jbHVk
ZS94ZW4vbGl2ZXBhdGNoX3BheWxvYWQuaCB8IDQgKystLQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS94ZW4vY29tcGlsZXIuaCBiL3hlbi9pbmNsdWRlL3hlbi9jb21waWxlci5oCj4+IGluZGV4
IGE3ZTA1NjgxYzkuLjAwMWY1ODk2NTUgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9j
b21waWxlci5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9jb21waWxlci5oCj4+IEBAIC0xOCw2
ICsxOCw4IEBACj4+ICAKPj4gICNkZWZpbmUgX19wYWNrZWQgICAgICBfX2F0dHJpYnV0ZV9fKChf
X3BhY2tlZF9fKSkKPj4gIAo+PiArI2RlZmluZSBfX3dlYWsgICAgICAgIF9fYXR0cmlidXRlX18o
KHdlYWspKQo+IAo+IF9fd2Vla19fICAoY2FuIGJlIGZpeGVkIG9uIGNvbW1pdCkKCk9oLCBpbmRl
ZWQsIGFzIGxvbmcgYXMgeW91IG1lYW4gX193ZWFrX18uCgo+IE90aGVyd2lzZSwgUmVpdmV3ZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
