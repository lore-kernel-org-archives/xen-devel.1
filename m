From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/5] x86/hvm: Adjust hvmemul_rep_stos() to
 compile with -Wvla
Date: Mon, 24 Sep 2018 14:20:06 +0100
Message-ID: <20180924132006.mkufwthiajqrsilf@zion.uk.xensource.com>
References: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
 <1537794003-30851-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1537794003-30851-4-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMjQsIDIwMTggYXQgMDI6MDA6MDFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBGb3IgYXQgbGVhc3QgImdjYyAoVWJ1bnR1IDUuNC4wLTZ1YnVudHUxfjE2LjA0LjEw
KSA1LjQuMCAyMDE2MDYwOSIsIHRoZQo+IHR5cGVjYXN0IG9mIGJ1ZiB0cmlnZ2VycyBhIFZhcmlh
YmxlIExlbmd0aCBBcnJheSB3YXJuaW5nLgo+IAo+IEFsdGVyIHRoZSBhc20gZXhwcmVzc2lvbiB0
byBhdm9pZCB0aGUgdHlwZWNhc3QsIHdoaWNoIG5lY2Vzc2l0YXRlcyB0aGUKPiBpbnRyb2R1Y3Rp
b24gb2YgYSBtZW1vcnkgY2xvYmJlciBhcyB0aGUgY29tcGlsZXIgY2FuIG5vIGxvbmdlciBpZGVu
dGlmeQo+IHRoZSB0b3RhbCBxdWFudGl0eSBvZiB3cml0dGVuIG1lbW9yeS4KPiAKPiBEZXNwaXRl
IHRoZSBtZW1vcnkgY2xvYmJlciwgdGhlcmUgaXMgbm8gY2hhbmdlIHRvIHRoZSBnZW5lcmF0ZWQu
CgpnZW5lcmF0ZWQgYXNzZW1ibHkgY29kZT8KCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
