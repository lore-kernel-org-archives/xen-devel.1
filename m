From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 11/16] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Fri, 07 Sep 2018 01:12:02 -0600
Message-ID: <5B9224C202000078001E628A@prv1-mh.provo.novell.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-12-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=p3pn=lv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fyAw1-0003oi-Hw
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 07:12:05 +0000
In-Reply-To: <20180904161533.11575-12-wei.liu2@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA5LjE4IGF0IDE4OjE1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L21tL01ha2VmaWxlCj4gKysrIGIveGVuL2FyY2gveDg2L21tL01h
a2VmaWxlCj4gQEAgLTEsMTUgKzEsMTYgQEAKPiAgc3ViZGlyLXkgKz0gc2hhZG93Cj4gLXN1YmRp
ci15ICs9IGhhcAo+ICtzdWJkaXItJChDT05GSUdfSFZNKSArPSBoYXAKPiAgCj4gLW9iai15ICs9
IHBhZ2luZy5vCj4gLW9iai15ICs9IHAybS5vIHAybS1wdC5vIHAybS1lcHQubyBwMm0tcG9kLm8K
PiAtb2JqLXkgKz0gYWx0cDJtLm8KPiArb2JqLSQoQ09ORklHX0hWTSkgKz0gYWx0cDJtLm8KPiAg
b2JqLXkgKz0gZ3Vlc3Rfd2Fsa18yLm8KPiAgb2JqLXkgKz0gZ3Vlc3Rfd2Fsa18zLm8KPiAgb2Jq
LXkgKz0gZ3Vlc3Rfd2Fsa180Lm8KPiArb2JqLXkgKz0gbWVtX2FjY2Vzcy5vCgpEZXNwaXRlIGl0
IGN1cnJlbnRseSBiZWluZyBhbHdheXMtb24gb24geDg2LCBwZXJoYXBzIHVzZQpvYmotJChDT05G
SUdfTUVNX0FDQ0VTUykgYXMgeW91IHRvdWNoIGl0IGFueXdheT8KCldpdGggb3Igd2l0aG91dCB0
aGlzCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CmZvciB0aGUgdGlu
eSBiaXQgb2YgdGhpcyBwYXRjaCB3aGVyZSBpdCdzIGFwcGxpY2FibGUuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
