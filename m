From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/xen: don't write ptes directly in
 32-bit PV guests
Date: Mon, 20 Aug 2018 02:38:28 -0600
Message-ID: <5B7A7E0402000078001DFD01__28748.4533073895$1534754238$gmane$org@prv1-mh.provo.novell.com>
References: <20180820051456.20779-1-jgross@suse.com>
 <20180820051456.20779-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1frfhs-00037j-FZ
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 08:38:36 +0000
In-Reply-To: <20180820051456.20779-2-jgross@suse.com>
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
Cc: the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA4LjE4IGF0IDA3OjE0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbiBz
b21lIGNhc2VzIDMyLWJpdCBQQUUgUFYgZ3Vlc3RzIHN0aWxsIHdyaXRlIFBURXMgZGlyZWN0bHkg
aW5zdGVhZCBvZgo+IHVzaW5nIGh5cGVyY2FsbHMuIFRoaXMgaXMgZXNwZWNpYWxseSBiYWQgd2hl
biBjbGVhcmluZyBhIFBURSBhcyB0aGlzIGlzCj4gZG9uZSB2aWEgMzItYml0IHdyaXRlcyB3aGlj
aCB3aWxsIHByb2R1Y2UgaW50ZXJtZWRpYXRlIEwxVEYgYXR0YWNrYWJsZQo+IFBURXMuCj4gCj4g
Q2hhbmdlIHRoZSBjb2RlIHRvIHVzZSBoeXBlcmNhbGxzIGluc3RlYWQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
