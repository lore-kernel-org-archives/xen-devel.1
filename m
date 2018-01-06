From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH 00/22] Vixen: A PV-in-HVM shim
Date: Sat, 6 Jan 2018 15:29:23 -0800
Message-ID: <CA+aC4ktm6PcO8O+VQzg+8ckvnJn+0znQdZ9WTyQzpr9K-zJ+3A@mail.gmail.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rl4w=eb=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eXxu4-0002sX-8j
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2018 23:29:28 +0000
Received: by mail-lf0-x236.google.com with SMTP id e27so8606866lfb.9
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jan 2018 15:29:25 -0800 (PST)
In-Reply-To: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKYW4gNiwgMjAxOCBhdCAyOjU0IFBNLCBBbnRob255IExpZ3VvcmkgPGFsaWd1b3Jp
QGFtem4uY29tPiB3cm90ZToKPiBGcm9tOiBBbnRob255IExpZ3VvcmkgPGFsaWd1b3JpQGFtYXpv
bi5jb20+Cj4KPiBDVkUtMjAxNy01NzU0IGlzIHByb2JsZW1hdGljIGZvciBwYXJhdmlydHVhbGl6
ZWQgeDg2IGRvbVVzIGJlY2F1c2UgaXQKPiBhcHBlYXJzIHRvIGJlIHZlcnkgZGlmZmljdWx0IHRv
IGlzb2xhdGUgdGhlIGh5cGVydmlzb3IncyBwYWdlIHRhYmxlcwo+IGZyb20gUFYgZG9tVXMgd2hp
bGUgbWFpbnRhaW5pbmcgQUJJIGNvbXBhdGliaWxpdHkuICBJbnN0ZWFkIG9mIHRyeWluZwo+IHRv
IG1ha2UgYSBLUFRJLWxpa2UgYXBwcm9hY2ggd29yayBmb3IgWGVuIFBWLCBpdCBzZWVtcyByZWFz
b25hYmxlIHRvCj4gcnVuIGEgY29weSBvZiBYZW4gd2l0aGluIGFuIEhWTSAob3IgUFZIKSBkb21V
IHRvIHByb3ZpZGUgYmFja3dhcmRzCj4gY29tcGF0aWJpbGl0eSB3aXRoIGd1ZXN0cyBhcyBtZW50
aW9uZWQgaW4gWFNBLTI1NCBbMV0uCgpJIGFsc28gcG9zdGVkIGEgYnJhbmNoIHdpdGggYSBiYWNr
cG9ydCB0byA0Ljkgc3RhYmxlLgoKaHR0cHM6Ly9naXRodWIuY29tL2FsaWd1b3JpL3hlbi90cmVl
L3ZpeGVuLXN0YWJsZS00LjkKCldoaWxlIHRoaXMgaXMgYSBiaWcgbW9yZSB0aGFuIHdoYXQgZ29l
cyBpbnRvIGEgdHlwaWNhbCBzdGFibGUgcmVsZWFzZSwgZ2l2ZW4KdGhhdCBpdCBpcyBhZGRyZXNz
aW5nIGEgc2VjdXJpdHkgaXNzdWUgYW5kIGlzIHJlbGF0aXZlbHkgd2VsbCBjb250YWluZWQsIEkg
dGhpbmsKaXQgd291bGQgYmUgd29ydGggY29uc2lkZXJpbmcgZm9yIGFkZGl0aW9uIHRvIHN0YWJs
ZS4KClJlZ2FyZHMsCgpBbnRob255IExpZ3VvcmkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
