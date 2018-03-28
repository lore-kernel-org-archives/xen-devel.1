From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/6] x86: fix OLDINSTR_2()
Date: Wed, 28 Mar 2018 09:48:39 +0100
Message-ID: <20180328084839.lccu6drhyapdxxtz@citrix.com>
References: <5AA7E79302000078001B0FAB@prv-mh.provo.novell.com>
 <5AA7EAEB02000078001B0FC8@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b9f4=gs=citrix.com=prvs=618f79229=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f16l9-0008Q3-67
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 08:48:43 +0000
Content-Disposition: inline
In-Reply-To: <5AA7EAEB02000078001B0FC8@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDg6MTQ6NTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSXRzIGFzX21heCgpIGludm9jYXRpb24gd2FzIHdyb25nbHkgcGFyZW50aGVzaXplZC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZp
ZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
