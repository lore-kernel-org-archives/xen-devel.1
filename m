From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Thu, 28 Mar 2019 01:46:57 -0600
Message-ID: <5C9C7BF1020000780022258F@prv1-mh.provo.novell.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9Pki-0000di-14
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 07:47:08 +0000
In-Reply-To: <20190318131155.29450-5-jgross@suse.com>
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

Pj4+IE9uIDE4LjAzLjE5IGF0IDE0OjExLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbnN0
ZWFkIG9mIGZyZWVpbmcgcGVyY3B1IGFyZWFzIGR1cmluZyBzdXNwZW5kIGFuZCBhbGxvY2F0aW5n
IHRoZW0KPiBhZ2FpbiB3aGVuIHJlc3VtaW5nIGtlZXAgdGhlbS4gT25seSBmcmVlIGFuIGFyZWEg
aW4gY2FzZSBhIGNwdSBkaWRuJ3QKPiBjb21lIHVwIGFnYWluIHdoZW4gcmVzdW1pbmcuCgpUaGVy
ZSdzIGFub3RoZXIgYXNwZWN0IGhlcmUgd2hpY2ggbmVlZHMgYXQgbGVhc3QgbWVudGlvbmluZzoK
UmlnaHQgbm93LCBDUFVzIGNvbWluZyBiYWNrIHVwIGhhdmUgdGhlaXIgcGVyLUNQVSBkYXRhCmNs
ZWFyZWQuIE5vdCBkb2luZyBzbyBtYXkgaW5kZWVkIGJlIGFuIGltcHJvdmVtZW50IGluCnNvbWUg
Y2FzZXMgKGxpa2Ugc3RhdGlzdGljcyBjb2xsZWN0ZWQpLCBidXQgbWF5IGFsc28gZ2V0IGluIHRo
ZQp3YXkgaW4gb3RoZXIgY2FzZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
