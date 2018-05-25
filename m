From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH] ap-common: Switch to Linux 4.14 by
 default on X86.
Date: Fri, 25 May 2018 16:47:29 +0200
Message-ID: <20180525144729.4pforl6bbt734jbh@MacBook-Pro-de-Roger.local>
References: <1527259493-6383-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ifz/=im=citrix.com=prvs=676f710cf=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fME0J-0004AI-Ud
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 14:47:39 +0000
Content-Disposition: inline
In-Reply-To: <1527259493-6383-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@linaro.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMjUsIDIwMTggYXQgMDM6NDQ6NTNQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gTGludXggNC45IGlzIGdldHRpbmcgYSBiaXQgbG9uZyBpbiB0aGUgdG9vdGguICA0LjE0
IGlzIGFuIExUUyBicmFuY2gKPiBhbmQgdGhlIG9zc3Rlc3QtdGVzdGVkIHZlcnNpb24gc2VlbXMg
cmVhc29uYWJseSBnb29kLiAgSSByYW4gYSBzcGVjaWFsCj4gcmVwb3J0WzFdIHRvIHNlZSB3aGF0
IHRvIGV4cGVjdCBhbmQgaXQgcmVwb3J0ZWQgbm8gcmVncmVzc2lvbnMuCj4gCj4gQWNjb3JkaW5n
bHkgSSBhbSBnb2luZyB0byBzd2l0Y2ggdG8gdXNpbmcgTGludXggNC4xNCBieSBkZWZhdWx0IGZv
cgo+IG1vc3QgWDg2IHJ1bnMgaW4gb3NzdGVzdC4gIEFSTSB0ZXN0cyBhcmUgbm90IGFmZmVjdGVk
IGF0IHRoaXMgdGltZTsKPiB0aGV5IHVzZSB0aGVpciBvd24gbGludXgtYXJtLXhlbiBicmFuY2gg
d2hpY2ggaXMgdXBkYXRlZCBieSB0aGUgWGVuCj4gQVJNIG1haW50YWluZXJzLgo+IAo+IFsxXSAu
L3NnLXJlcG9ydC1mbGlnaHQgLS10aGF0LWxpbnV4PTZiYTg5YjUyYmE2OTE2YmM3YTNkMzkwZDcw
OTUxZTk5MmMwY2EzOWUgLS10aGlzLWxpbnV4PWQ4ODcwMGY3OTQ0OGZjOGYwMzYxN2Q0ZjE5Mjlj
Mzk2NzZmOGQxZTQgLS1icmFuY2hlcy1hbHNvPWxpbnV4LTQuOSxsaW51eC00LjE0LGxpbnV4LWFy
bS14ZW4gMTIyOTc0IHxsZXNzCj4gCj4gQ0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBD
QzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgo+
IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgoK
Tm8gb2JqZWN0aW9uczoKClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
