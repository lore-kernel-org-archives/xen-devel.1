From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] Config.mk: extend cc-option to consider
 exit status
Date: Thu, 15 Mar 2018 06:56:17 -0600
Message-ID: <5AAA7B8102000078001B223F@prv-mh.provo.novell.com>
References: <20180315124652.930-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewSQj-0000bO-CV
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 12:56:25 +0000
In-Reply-To: <20180315124652.930-1-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, cardoe@cardoe.com, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDEzOjQ2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T3B0aW9uIGxpa2UgLU9nIHByb2R1Y2VzIHNvbWV0aGluZyBsaWtlCj4gCj4gICBjYzE6IGVycm9y
OiBhcmd1bWVudCB0byAnLU8nIHNob3VsZCBiZSBhIG5vbi1uZWdhdGl2ZSBpbnRlZ2VyCj4gCj4g
d2l0aCBhIGNvbXBpbGVyIHRoYXQgZG9lc24ndCBzdXBwb3J0IGl0Lgo+IAo+IEdyZXBwaW5nIGZv
ciB0aGUgZXhhY3Qgb3B0aW9uIHdvdWxkbid0IHdvcmsuIEV4dGVuZCBjYy1vcHRpb24gdG8gdGFr
ZQo+IGludG8gYWNjb3VudCB0aGUgZXhpdCBzdGF0dXMgb2YgdGhlIHRlc3QuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpUYWtpbmcgb24gbXkgcmV2aWV3ZXIncyBo
YXQ6Cgo+IC0tLSBhL0NvbmZpZy5tawo+ICsrKyBiL0NvbmZpZy5tawo+IEBAIC0xMDAsNyArMTAw
LDcgQEAgUFlUSE9OX1BSRUZJWF9BUkcgPz0gLS1wcmVmaXg9IiQocHJlZml4KSIKPiAgIwo+ICAj
IFVzYWdlOiBjZmxhZ3MteSArPSAkKGNhbGwgY2Mtb3B0aW9uLCQoQ0MpLC1tYXJjaD13aW5jaGlw
LWM2LC1tYXJjaD1pNTg2KQo+ICBjYy1vcHRpb24gPSAkKHNoZWxsIGlmIHRlc3QgLXogImBlY2hv
ICd2b2lkKnA9MTsnIHwgXAo+IC0gICAgICAgICAgICAgICQoMSkgJCgyKSAtUyAtbyAvZGV2L251
bGwgLXggYyAtIDI+JjEgfCBncmVwIC0tICQoMikgLWAiOyBcCj4gKyAgICAgICAgICAgICAgeyAk
KDEpICQoMikgLVMgLW8gL2Rldi9udWxsIC14IGMgLSAyPiYxIHx8IGVjaG8gJCgyKTsgfSB8IGdy
ZXAgLS0gJCgyKSAtYCI7IFwKCkkgb25seSBub3cgcmVhbGl6ZSB0aGF0IGNvbXBpbGVycyBhcmUg
cGVybWl0dGVkIHRvIGFjdHVhbGx5IGVycm9yCm9uIHRoZSBjb25zdHJ1Y3QgYmVpbmcgY29tcGls
ZWQgKGl0IGp1c3Qgc28gaGFwcGVucyB0aGF0IGdjYyBhcwphbiBleHRlbnNpb24gYWxsb3dzIGlu
dGVncmFsIHR5cGVzIGJlIGFzc2lnbmVkIHRvIHBvaW50ZXIgdHlwZQp2YXJpYWJsZXMpLiBIZW5j
ZSBhdCB0aGUgdmVyeSBsZWFzdCB5b3UgbmVlZCB0byBiZSBjZXJ0YWluIChhbmQKc2hvdWxkIHNh
eSBzbyBpbiB0aGUgZGVzY3JpcHRpb24pIHRoYXQgbm8gY29tcGlsZXIgKHZlcnNpb24pIHdlCnN1
cHBvcnQgd291bGQgZXJyb3Igb24gdGhhdCBjb25zdHJ1Y3QuCgpKYW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
