From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 6/6] x86/microcode: Synchronize late
 microcode loading
Date: Wed, 12 Dec 2018 00:26:24 -0700
Message-ID: <5C10B8200200007800205515@prv1-mh.provo.novell.com>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-7-git-send-email-chao.gao@intel.com>
 <5C0FED5702000078002053C6@prv1-mh.provo.novell.com>
 <20181211181652.GC25566@otc-nc-03>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWyug-0002Fo-V0
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 07:26:35 +0000
In-Reply-To: <20181211181652.GC25566@otc-nc-03>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ashok Raj <ashok.raj@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Borislav Petkov <bp@suse.de>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjEyLjE4IGF0IDE5OjE2LCA8YXNob2sucmFqQGludGVsLmNvbT4gd3JvdGU6Cj4g
QlRXOiBBcGFydCBmcm9tIHRoZSBmYWN0IGl0cyB1Z2x5IGFuZCB0YWtlIGEgbG9vb29uZyB0aW1l
IHRvIGNvbXBsZXRlLCBkbyB5b3UKPiBoYXZlIGFueSBwcmFjdGljYWwgaXNzc3VlcyB5b3Ugd2Fu
dCB0byBoaWdobGlnaHQ/IG1heWJlIHRoYXQgY2FuIAo+IGhlbHAgdXBzdHJlYW0gYXMgd2VsbC4K
ClRoZSBzaXR1YXRpb24gZm9yIGEga2VybmVsIGFuZCBhIGh5cGVydmlzb3IgbWlnaHQgYmUgZGlm
ZmVyZW50IGhlcmUKKGJ1dCBpbiB0aGUgTGludXggY2FzZSBtYXkgdGhlbiBiZSBtb3JlIGh5cGVy
dmlzb3ItbGlrZSB3aGVuCmNvbnNpZGVyaW5nIEtWTSk6IFRoZSBoeXBlcnZpc29yIG5lZWRzIHRv
IG1ha2Ugc3VyZSBpbiBwYXJ0aWN1bGFyCnRpbWUgbWFuYWdlbWVudCB3aXRoaW4gZ3Vlc3RzIHdv
bid0IGJyZWFrLiBTdG9wcGluZyB0aGUKbWFjaGluZSBmb3IgYW4gZXh0ZW5kZWQgcGVyaW9kIG9m
IHRpbWUgbWF5IG5vdCBiZSBoZWxwZnVsIHRoZXJlLgpGb3IgcHJvY2Vzc2VzIGluIGFuIE9TIHRo
ZSBjb25zdHJhaW50cyBtaWdodCBub3QgYmUgYXMgdGlnaHQsIGJ1dApJIGNvdWxkIGltYWdpbmcg
cHJvYmxlbXMgZXZlbiB0aGVyZSBpbiBzb21lIGxlc3MgY29tbW9uIGNhc2VzLgoKVGhhdCBzYWlk
LCBJJ20gbm90IGNvbnZpbmNlZCBhdCBhbGwgaXQgaXMgYSBnb29kIGlkZWEgdG8gbG9hZCBuZXcK
dWNvZGUgd2hpbGUgX2FueV8gZ3Vlc3RzIGFyZSBydW5uaW5nLCBidXQgd2UncmUgdGFsa2luZyBh
Ym91dCBhCmxhc3QgcmVzb3J0IGFwcHJvYWNoIGhlcmUgYW55d2F5LgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
