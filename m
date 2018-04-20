From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 10/16] os-posix: Provide new
 -runas <uid>:<gid> facility
Date: Fri, 20 Apr 2018 14:56:35 +0200
Message-ID: <87in8myr24.fsf@dusky.pond.sub.org>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-11-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=urkr=hj=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1f9Vai-0008OC-Cy
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 12:56:40 +0000
In-Reply-To: <1524156319-11465-11-git-send-email-ian.jackson@eu.citrix.com>
 (Ian Jackson's message of "Thu, 19 Apr 2018 17:45:13 +0100")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+IHdyaXRlczoKCj4gVGhpcyBh
bGxvd3MgdGhlIGNhbGxlciB0byBzcGVjaWZ5IGEgdWlkIGFuZCBnaWQgdG8gdXNlLCBldmVuIGlm
IHRoZXJlCj4gaXMgbm8gY29ycmVzcG9uZGluZyBwYXNzd29yZCBlbnRyeS4gIFRoaXMgd2lsbCBi
ZSB1c2VmdWwgaW4gY2VydGFpbgo+IFhlbiBjb25maWd1cmF0aW9ucy4KPgo+IFdlIGRvbid0IHN1
cHBvcnQganVzdCAtcnVuYXMgPHVpZD4gYmVjYXVzZTogKGkpIGRlcHJpdmlsZWdpbmcgd2l0aG91
dAo+IGNhbGxpbmcgc2V0Z3JvdXBzIHdvdWxkIGJlIGluZWZmZWN0aXZlIChpaSkgZ2l2ZW4gb25s
eSBhIHVpZCB3ZSBkb24ndAo+IGtub3cgd2hhdCBnaWQgd2Ugb3VnaHQgdG8gdXNlIChzaW5jZSB1
aWRzIG1heSBlcHBlYXIgaW4gbXVsdGlwbGUKPiBwYXNzd2QgZmlsZSBlbnRyaWVzIHdpdGggZGlm
ZmVyZW50IGdpZHMpLgo+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29u
QGV1LmNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPgo+IENDOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29t
Pgo+IENDOiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+Cj4gQ0M6IERhbmll
bCBQLiBCZXJyYW5nZSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KPiBDQzogTWljaGFlbCBUb2thcmV2
IDxtanRAdGxzLm1zay5ydT4KClJldmlld2VkLWJ5OiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1
QHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
