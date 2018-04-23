From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH-for-4.11 v2] xpti: fix bug in double fault
 handling
Date: Mon, 23 Apr 2018 06:49:17 -0600
Message-ID: <5ADDD64D02000078001BD917@prv1-mh.provo.novell.com>
References: <20180423123806.12650-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jo30=hm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fAauI-0005sh-Ph
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 12:49:22 +0000
In-Reply-To: <20180423123806.12650-1-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA0LjE4IGF0IDE0OjM4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBXaGVu
IGVudGVyaW5nIHRoZSBoeXBlcnZpc29yIHZpYSB0aGUgZG91YmxlIGZhdWx0IGhhbmRsZXIgcmVz
ZXR0aW5nCj4geGVuX2NyMyB3YXMgbWlzc2luZy4gVGhpcyBsZWQgdG8gc3dpdGNoaW5nIHRvIHB2
X2NyMyB3aGVuIHJldHVybmluZwo+IGZyb20gdGhlIG5leHQgZm9sbG93aW5nIGludGVycnVwdC4g
U28gcmVwYWlyIHRoaXMgaW4gb3JkZXIgdG8gYWxsb3cKPiBpbnRlcnJ1cHQgaGFuZGxpbmcgdG8g
d29yayBldmVuIGFmdGVyIGEgZG91YmxlIGZhdWx0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCldpdGggcy9pbnRlcnJ1cHQvZXhjZXB0aW9uLyAo
b3Igcy9pbnRlcnJ1cHQvaW50ZXJydXB0aW9uLykgb24gdGhlCmRlc2NyaXB0aW9uICh3aGljaCBp
cyBlYXN5IGVub3VnaCB0byBkbyB3aGlsZSBjb21taXR0aW5nKQpSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSB0YWtlIGl0IHRoYXQgeW91ciBSYWIgY2FuIGJl
IGltcGxpZWQgaGVyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
