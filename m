From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 2/8] x86: disable XPTI when RDCL_NO
Date: Wed, 21 Mar 2018 09:06:51 +0000
Message-ID: <20180321090651.6wm32jd7hyixyrrd@citrix.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCB5C02000078001B370A@prv-mh.provo.novell.com>
 <5AAFCC7D02000078001B3738@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=24tk=gl=citrix.com=prvs=6111f1d8b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eyZiR-0004C3-5v
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 09:07:27 +0000
Content-Disposition: inline
In-Reply-To: <5AAFCC7D02000078001B3738@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTksIDIwMTggYXQgMDc6NDM6MDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjAzLjE4IGF0IDE0OjM4LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+ID4gVXNlIHRoZSByZXNwZWN0aXZlIEFSQ0hfQ0FQQUJJTElUSUVTIE1TUiBiaXQsIGJ1dCBk
b24ndCBleHBvc2UgdGhlIE1TUgo+ID4gdG8gZ3Vlc3RzIHlldC4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gVGVzdGVkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
