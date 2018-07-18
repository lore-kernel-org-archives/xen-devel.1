From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/efi: split compiler vs linker
 support
Date: Wed, 18 Jul 2018 03:35:20 -0600
Message-ID: <5B4F09D802000078001D550A@prv1-mh.provo.novell.com>
References: <20180716140724.44509-1-roger.pau@citrix.com>
 <20180716140724.44509-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rjtn=kc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ffirk-0003iK-IL
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 09:35:24 +0000
In-Reply-To: <20180716140724.44509-3-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA3LjE4IGF0IDE2OjA3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmls
ZQo+IEBAIC0xNjMsMTEgKzE2MywxMiBAQCBFRklfTERGTEFHUyArPSAtLW1pbm9yLWltYWdlLXZl
cnNpb249JChYRU5fU1VCVkVSU0lPTikKPiAgRUZJX0xERkxBR1MgKz0gLS1tYWpvci1vcy12ZXJz
aW9uPTIgLS1taW5vci1vcy12ZXJzaW9uPTAKPiAgRUZJX0xERkxBR1MgKz0gLS1tYWpvci1zdWJz
eXN0ZW0tdmVyc2lvbj0yIC0tbWlub3Itc3Vic3lzdGVtLXZlcnNpb249MAo+ICAKPiAtIyBDaGVj
ayBpZiB0aGUgYnVpbGQgc3lzdGVtIHN1cHBvcnRzIFBFLgo+IC1YRU5fQlVJTERfUEUgOj0gJChz
aGVsbCAkKENDKSAkKGZpbHRlci1vdXQgJChDRkxBR1MteSkgLiUuZCwkKENGTEFHUykpIC1jIGVm
aS9jaGVjay5jIC1vIGVmaS9jaGVjay5vIDI+L2Rldi9udWxsICYmIGVjaG8geSkKPiAtZXhwb3J0
IFhFTl9CVUlMRF9QRSA6PSAkKGlmICQoWEVOX0JVSUxEX1BFKSwkKHNoZWxsICQoTEQpIC1taTM4
NnBlcCAtLXN1YnN5c3RlbT0xMCAtbyBlZmkvY2hlY2suZWZpIGVmaS9jaGVjay5vIDI+L2Rldi9u
dWxsICYmIGVjaG8geSkpCj4gLWlmZXEgKCQoWEVOX0JVSUxEX1BFKSx5KQo+IC1DRkxBR1MgKz0g
LURYRU5fQlVJTERfUEUKPiArIyBDaGVjayBpZiB0aGUgY29tcGlsZXIgc3VwcG9ydHMgdGhlIE1T
IEFCSS4KPiArZXhwb3J0IFhFTl9CVUlMRF9FRkkgOj0gJChzaGVsbCAkKENDKSAkKGZpbHRlci1v
dXQgJChDRkxBR1MteSkgLiUuZCwkKENGTEFHUykpIC1jIGVmaS9jaGVjay5jIC1vIGVmaS9jaGVj
ay5vIDI+L2Rldi9udWxsICYmIGVjaG8geSkKPiArIyBDaGVjayBpZiB0aGUgbGlua2VyIHN1cHBv
cnRzIFBFLgo+ICtYRU5fQlVJTERfUEUgOj0gJChpZiAkKFhFTl9CVUlMRF9FRkkpLCQoc2hlbGwg
JChMRCkgLW1pMzg2cGVwIC0tc3Vic3lzdGVtPTEwIC1vIGVmaS9jaGVjay5lZmkgZWZpL2NoZWNr
Lm8gMj4vZGV2L251bGwgJiYgZWNobyB5KSkKPiAraWZlcSAoJChYRU5fQlVJTERfRUZJKSx5KQo+
ICtDRkxBR1MgKz0gLURYRU5fQlVJTERfRUZJCj4gIGVuZGlmCgpXaXRoIHRoaXMgc3VpdGFibHkg
cmUtYmFzZWQgYWNjb3JkaW5nIHRvIHRoZSBjaGFuZ2VzIHJlcXVlc3RlZCB0bwpwYXRjaCAxOgpS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
