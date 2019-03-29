From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/Xen: streamline (and fix) PV CPU
 enumeration
Date: Fri, 29 Mar 2019 09:42:27 -0400
Message-ID: <24df98be-21e7-617e-7651-ae34e2a2e512__9312.96918295033$1553867026$gmane$org@oracle.com>
References: <5C9B92EA020000780022227B@prv1-mh.provo.novell.com>
 <2f027b4b-dce2-3e90-dc1b-c824bc8eb355@oracle.com>
 <5C9C8DDC0200007800222606@prv1-mh.provo.novell.com>
 <eda3938f-02a5-e5a2-4718-d75bc488f296@oracle.com>
 <5C9DDD530200007800222B22@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=40d3=SA=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h9rmT-0003dk-8m
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 13:42:49 +0000
In-Reply-To: <5C9DDD530200007800222B22@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMy8yOS8xOSA0OjU0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyOC4wMy4xOSBh
dCAxNzo1MCwgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToKPj4KPj4gR2l2ZW4g
ZXNwZWNpYWxseSB4ZW5fcHZfc21wX3ByZXBhcmVfY3B1cygpLCBJIHRoaW5rIHJlLXdvcmtpbmcg
cHJvcGVyCj4+IHNldHRpbmcgb2YgcHJlc2VudC9wb3NzaWJsZSBtYXNrcyBpcyB3ZWxsIGJleW9u
ZCB0aGUgc2NvcGUgb2YgeW91cgo+PiBvcmlnaW5hbCBwYXRjaC4KPiBXZWxsLCB0aGVuIHRoZSBx
dWVzdGlvbiBpcywgd2hhdCAoaWYgYW55KSBjaGFuZ2VzIGFyZSB5b3UKPiBleHBlY3RpbmcgbWUg
dG8gbWFrZSBmb3IgdGhpcyBjaGFuZ2UgdG8gYmUgYWNjZXB0YWJsZT8gT3IgZG8KPiB5b3UgcGVy
aGFwcyB3YW50IG1lIHRvIGFkZCBhIDJuZCBwYXRjaCBvbiB0b3AgYWRkcmVzc2luZwo+IHRoZSBv
dGhlciBvdXRsaW5lZCBhbm9tYWxpZXM/CgpJZiB5b3VyIGdvYWwgaXMganVzdCB0byBmaXggdGhl
IGRvbTBfbWF4X3ZjcHVzIGlzc3VlIHRoZW4gdGhpcyBwYXRjaCBpcwpzdWZmaWNpZW50IChidXQg
dGhlIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBzYXkgdGhhdCB0aGlzIGlzIHdoYXQgdGhlCnBhdGNo
IGlzIGZvcikuCgpCdXQgaWYgeW91IGFyZSB0cnlpbmcgdG8gbWFrZSBjcHUgbWFza3MgbWFuYWdl
bWVudCBkb25lIHByb3Blcmx5IHRoZW4gSQp0aGluayB0aGlzIHBhdGNoIGFsb25lIGRvZXMgbm90
IGFkZHJlc3MgdGhpcyBmdWxseS4KCi1ib3JpcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
