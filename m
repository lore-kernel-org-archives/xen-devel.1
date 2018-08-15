From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH RESEND] compat-ioctl/Xen: support at least
 some IOCTLs of evtchn and privcmd
Date: Wed, 15 Aug 2018 13:51:14 +0100
Message-ID: <20180815125114.GV6515@ZenIV.linux.org.uk>
References: <5B30C6E202000078001CD724@prv1-mh.provo.novell.com>
 <5B73C5D402000078001DE189@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hkmn=k6=ftp.linux.org.uk=viro@srs-us1.protection.inumbo.net>)
 id 1fpvGk-0002Cj-M9
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 12:51:22 +0000
Content-Disposition: inline
In-Reply-To: <5B73C5D402000078001DE189@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-fsdevel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMTUsIDIwMTggYXQgMTI6MTk6MDBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hpbGUgdGhpcyBpcyBvbmx5IGEgc3RhcnQgKElPQ1RMX1BSSVZDTURfTU1BUCogYW5k
IElPQ1RMX1BSSVZDTURfRE1fT1AKPiByZXF1aXJlIG1vcmUgd29yayksIGl0IGF0IGxlYXN0IGFs
bG93cyBzb21lIHNpbXBsZSBvcGVyYXRpb25zIChsaWtlCj4gInhsIGRtZXNnIikgd2hpY2ggaGF2
ZSBhbHdheXMgYmVlbiBhdmFpbGFibGUgb24gWGVub0xpbnV4IHRvIHdvcmsgYWdhaW4KPiB3aXRo
IGEgNjQtYml0IGtlcm5lbCB1bmRlcm5lYXRoIGEgMzItYml0IGRpc3Ryby4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQWNrZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpOYWNrZWQtYnk6IEFsIFZpcm8gPHZpcm9AemVu
aXYubGludXgub3JnLnVrPgoKCVRoaXMgYmVsb25ncyBpbiBkcml2ZXJzL3hlbi9wcml2Y21kLmMs
IG5vdCBpbiBmcy9jb21wYXRfaW9jdGwuYwoqQU5ZKiBzaW5nbGUtZHJpdmVyIGlvY3RsIGRlZmlu
aXRlbHkgc2hvdWxkIGJlIGhhbmRsZWQgYnkgLT5jb21wYXRfaW9jdGwoKQptZXRob2QgYW5kIGFu
eSBwYXRjaGVzIGR1bXBpbmcgc3VjaCBzdHVmZiBpbnRvIGZzL2NvbXBhdF9pb2N0bC5jIHdpbGwg
YmUKcmVqZWN0ZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
