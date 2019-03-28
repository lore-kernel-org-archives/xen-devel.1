From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Thu, 28 Mar 2019 02:04:32 -0600
Message-ID: <5C9C801002000078002225AE@prv1-mh.provo.novell.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-5-jgross@suse.com>
 <5C9C7BF1020000780022258F@suse.com>
 <78816896-aa22-0031-4d36-bc33bee78c83@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9Q1a-0002ye-VK
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 08:04:34 +0000
In-Reply-To: <78816896-aa22-0031-4d36-bc33bee78c83@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE5IGF0IDA4OjUzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
OC8wMy8yMDE5IDA4OjQ2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTguMDMuMTkgYXQg
MTQ6MTEsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gSW5zdGVhZCBvZiBmcmVlaW5nIHBl
cmNwdSBhcmVhcyBkdXJpbmcgc3VzcGVuZCBhbmQgYWxsb2NhdGluZyB0aGVtCj4+PiBhZ2FpbiB3
aGVuIHJlc3VtaW5nIGtlZXAgdGhlbS4gT25seSBmcmVlIGFuIGFyZWEgaW4gY2FzZSBhIGNwdSBk
aWRuJ3QKPj4+IGNvbWUgdXAgYWdhaW4gd2hlbiByZXN1bWluZy4KPj4gCj4+IFRoZXJlJ3MgYW5v
dGhlciBhc3BlY3QgaGVyZSB3aGljaCBuZWVkcyBhdCBsZWFzdCBtZW50aW9uaW5nOgo+PiBSaWdo
dCBub3csIENQVXMgY29taW5nIGJhY2sgdXAgaGF2ZSB0aGVpciBwZXItQ1BVIGRhdGEKPj4gY2xl
YXJlZC4gTm90IGRvaW5nIHNvIG1heSBpbmRlZWQgYmUgYW4gaW1wcm92ZW1lbnQgaW4KPj4gc29t
ZSBjYXNlcyAobGlrZSBzdGF0aXN0aWNzIGNvbGxlY3RlZCksIGJ1dCBtYXkgYWxzbyBnZXQgaW4g
dGhlCj4+IHdheSBpbiBvdGhlciBjYXNlcy4KPiAKPiBJIGhhdmUgY2hlY2tlZCB0aGUgcmVzcGVj
dGl2ZSBjcHUgbm90aWZpZXIgaG9va3MgYW5kIEkgdGhpbmsgdGhpcyBpcyBubwo+IHByb2JsZW0u
IEkgaG9wZSBJIGRpZG4ndCBvdmVybG9vayBzb21ldGhpbmcuCgpJcyBjaGVja2luZyB0aGUgaG9v
a3Mgc3VmZmljaWVudD8gSSdkIHJhdGhlciBleHBlY3Qgd2UgbmVlZCB0bwpjaGVjayBhbGwgcGVy
LUNQVSBkYXRhIG9iamVjdHMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
