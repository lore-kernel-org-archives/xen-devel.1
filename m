From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 3/4] x86/e820: assume memmap provided
 when booted virtualized is correct
Date: Tue, 08 Jan 2019 02:56:03 -0700
Message-ID: <5C3473B3020000780020B373@prv1-mh.provo.novell.com>
References: <20181228120404.50346-1-roger.pau@citrix.com>
 <20181228120404.50346-4-roger.pau@citrix.com>
 <20190102124436.b4zgzdbyv5i3q35r@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4mQY=PQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggo7J-0007tk-NI
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 09:56:13 +0000
In-Reply-To: <20190102124436.b4zgzdbyv5i3q35r@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@cirix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAxLjE5IGF0IDEzOjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBEZWMgMjgsIDIwMTggYXQgMDE6MDQ6MDNQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+PiBUaGlzIGltcGxpZXMgdGhlcmUncyBubyBuZWVkIHRvIGZvcmNlZnVsbHkgcmVz
ZXJ2ZSB0aGUgVkdBIE1NSU8KPj4gcmVnaW9uLCBzaW5jZSB0aGUgbWVtb3J5IG1hcCBwcm92aWRl
ZCB3aWxsIGJlIGNvcnJlY3QuCj4+IAo+PiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpcml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cm9uY2Ugc3VpdGFibHkgcmUtYmFzZWQgb3ZlciB3aGF0ZXZlciBjaGFuZ2VzIHRvIHRoZSBlYXJs
aWVyCnBhdGNoZXMgd2lsbCBiZSBkb25lLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
