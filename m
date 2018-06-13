From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: don't use privcmd_call() from
 xen_mc_flush()
Date: Wed, 13 Jun 2018 04:05:32 -0600
Message-ID: <5B20EC6C02000078001CACBA__49529.8460046344$1528884266$gmane$org@prv1-mh.provo.novell.com>
References: <20180613095806.2978-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bhoq=i7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fT2en-0000eB-2q
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 10:05:37 +0000
In-Reply-To: <20180613095806.2978-1-jgross@suse.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA2LjE4IGF0IDExOjU4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBVc2lu
ZyBwcml2Y21kX2NhbGwoKSBmb3IgYSBzaW5nbGV0b24gbXVsdGljYWxsIHNlZW1zIHRvIGJlIHdy
b25nLCBhcwo+IHByaXZjbWRfY2FsbCgpIGlzIHVzaW5nIHN0YWMoKS9jbGFjKCkgdG8gZW5hYmxl
IGh5cGVydmlzb3IgYWNjZXNzIHRvCj4gTGludXggdXNlciBzcGFjZS4KPiAKPiBBZGQgYSBuZXcg
eGVuX3NpbmdsZV9jYWxsKCkgZnVuY3Rpb24gdG8gYmUgdXNlIGZvciB0aGF0IHB1cnBvc2UuCj4g
Cj4gUmVwb3J0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
