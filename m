From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86: correct assertion in
 destroy_perdomain_mapping()
Date: Mon, 23 Apr 2018 15:41:45 +0200
Message-ID: <db87e276-97ea-83e9-547c-633944ec7e47@suse.com>
References: <5ADA014A02000078001BD11B@prv1-mh.provo.novell.com>
 <ac79f3ac-6269-5384-f087-fa6090d92651@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhva=hm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fAbj1-0001cP-WC
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 13:41:48 +0000
In-Reply-To: <ac79f3ac-6269-5384-f087-fa6090d92651@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDQvMTggMTU6MzksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjAvMDQvMTggMTY6
MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBodm1fZG9tYWluX2luaXRpYWxpc2UoKSBtYXkgY2Fs
bCB0aGlzIHdpdGggbnIgYmVpbmcgemVybywgd2hpY2ggdHJpZ2dlcnMKPj4gdGhlICJkb2VzIG5v
dCBjcm9zcyBMMyBib3VuZGFyeSIgY2hlY2suCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
