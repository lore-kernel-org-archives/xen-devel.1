From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 2/3] x86/mm: make
 guest_physmap_add_entry() HVM-only
Date: Mon, 13 May 2019 17:20:45 +0100
Message-ID: <31714b6c-f9c9-4c80-fb9d-b4190670b736@citrix.com>
References: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
 <5CD42EB9020000780022D332@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fllF=TN=citrix.com=prvs=029ba87d2=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hQDh9-0006KH-Cx
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 16:20:55 +0000
In-Reply-To: <5CD42EB9020000780022D332@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS85LzE5IDI6NDQgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IExpZnQgaXRzICFwYWdpbmdf
bW9kZV90cmFuc2xhdGUoKSBwYXJ0IGludG8gZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZSgpCj4gKHdo
aWNoIGlzIHdoYXQgY29tbW9uIGNvZGUgY2FsbHMpLCBlbGltaW5hdGluZyB0aGUgZHVtbXkgdXNl
IG9mIGEKPiAoSFZNLW9ubHkgcmVhbGx5KSBQMk0gdHlwZSBpbiB0aGUgUFYgY2FzZS4KPiAKPiBT
dWdnZXN0ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpUaGFua3Ms
IGxvb2tzIGdvb2Q6CgpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
