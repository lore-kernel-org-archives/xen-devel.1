From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/p2m: fixed p2m_change_type_range()
 start / end check
Date: Wed, 18 Apr 2018 04:53:43 -0600
Message-ID: <5AD723B702000078001BC5E3@prv1-mh.provo.novell.com>
References: <1523985391-4557-1-git-send-email-rcojocaru@bitdefender.com>
 <5AD6F5E802000078001BC3EE@prv1-mh.provo.novell.com>
 <06afcce1-0390-c26b-d654-63c866329df4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <06afcce1-0390-c26b-d654-63c866329df4@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA0LjE4IGF0IDEyOjIzLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBUaGF0IGlzLCBzZW5zaWJsZSBpbnB1dCBsb29rcyBsaWtlOgo+ICogc3RhcnQgPCBlbmQK
PiAqIEZvciBob3N0cDJtczoKPiAgLSBzdGFydCA8PSBtYXhfbWFwcGVkX3Bmbgo+ICAtIGVpdGhl
ciBlbmQgPD0gbWF4X21hcHBlZF9wZm4sIG9yIGVuZCA9PSB+MFVMCj4gKEJ1dCBmb3IgYWx0cDJt
cywgc3RhcnQgb3IgZW5kID4gbWF4X21hcHBlZF9wZm4gaXMgZmluZS4pCgpTbyBJIGd1ZXNzIHRo
YXQncyBwYXJ0IG9mIHRoZSBkaWZmaWN1bHR5IEknbSBoYXZpbmcgd2l0aCB0aGUgb3JpZ2luYWwg
c3VnZ2VzdGlvbjoKV2h5IHdvdWxkIHN1Y2ggaW5wdXQgYmUgb2theSBmb3IgYWx0ZXJuYXRpdmUg
cDJtLXM/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
