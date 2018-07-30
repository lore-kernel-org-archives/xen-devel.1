From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] xen-netfront: wait xenbus state change when
 load module manually
Date: Mon, 30 Jul 2018 09:41:05 -0700 (PDT)
Message-ID: <20180730.094105.276965999059841658.davem__35447.5664710209$1532968803$gmane$org@davemloft.net>
References: <20180727095608.25210-1-xiliang@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7hur=ko=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1fkBEL-00080M-LH
 for xen-devel@lists.xenproject.org; Mon, 30 Jul 2018 16:41:09 +0000
In-Reply-To: <20180727095608.25210-1-xiliang@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xiliang@redhat.com
Cc: jgross@suse.com, netdev@vger.kernel.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogWGlhbyBMaWFuZyA8eGlsaWFuZ0ByZWRoYXQuY29tPgpEYXRlOiBGcmksIDI3IEp1bCAy
MDE4IDE3OjU2OjA4ICswODAwCgo+IFdoZW4gbG9hZGluZyBtb2R1bGUgbWFudWFsbHksIGFmdGVy
IGNhbGwgeGVuYnVzX3N3aXRjaF9zdGF0ZSB0byBpbml0aWFsaXplcwo+IHRoZSBzdGF0ZSBvZiB0
aGUgbmV0ZnJvbnQgZGV2aWNlLCB0aGUgZHJpdmVyIHN0YXRlIGRpZCBub3QgY2hhbmdlIHNvIGZh
c3QKPiB0aGF0IG1heSBsZWFkIG5vIGRldiBjcmVhdGVkIGluIGxhdGVzdCBrZXJuZWwuIFRoaXMg
cGF0Y2ggYWRkcyB3YWl0IHRvIG1ha2UKPiBzdXJlIHhlbmJ1cyBrbm93cyB0aGUgZHJpdmVyIGlz
IG5vdCBpbiBjbG9zZWQvdW5rbm93biBzdGF0ZS4KIC4uLgo+IFNpZ25lZC1vZmYtYnk6IFhpYW8g
TGlhbmcgPHhpbGlhbmdAcmVkaGF0LmNvbT4KCkFwcGxpZWQgYW5kIHF1ZXVlZCB1cCBmb3IgLXN0
YWJsZSwgdGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
