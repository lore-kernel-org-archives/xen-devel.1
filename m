From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] x86/pv: Code improvements to
 do_update_descriptor()
Date: Fri, 7 Dec 2018 11:24:26 +0000
Message-ID: <20181207112426.g2hnnxoscd24vdfg@zion.uk.xensource.com>
References: <1544119435-15037-1-git-send-email-andrew.cooper3@citrix.com>
 <1544119435-15037-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1544119435-15037-3-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMDY6MDM6NTVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiAgKiBBZGQgInVpbnQ2NF90IHJhdyIgdG8gc2VnX2Rlc2NfdCB0byByZW1vdmUgdGhl
IG9wZW5jb2RlZCB1aW50NjRfdCBjYXN0aW5nCj4gICAgaW4gdGhpcyBmdW5jdGlvbi4KPiAgKiBS
ZW5hbWUgdGhlICdwYScgcGFyYW1ldGVyIHRvICdnYWRkcicsIGJlY2F1c2UgaXQgbGl2ZXMgaW4g
R0ZOIHNwYWNlIHJhdGhlcgo+ICAgIHRoYW4gcGh5c2ljYWwgYWRkcmVzcyBzcGFjZS4KPiAgKiBV
c2UgZ2ZuX3QgYW5kIG1mbl90IHJhdGhlciB0aGFuIHVuc2lnbmVkIGxvbmdzLgo+ICAqIENoZWNr
IHRoZSBhbGlnbm1lbnQgYW5kIHByb3Bvc2VkIG5ldyBkZXNjcmlwdG9yIGJlZm9yZSB0YWtpbmcg
YSBwYWdlCj4gICAgcmVmZXJlbmNlLgo+ICAqIFJldXNlIHRoZSBvdXQgbGFiZWwgZm9yIGFsbCBl
eGl0IHBhdGhzLgo+ICAqIFVzZSB0aGUgbW9yZSBmbGV4aWJsZSBBQ0NFU1NfT05DRSgpIGFjY2Vz
c29yIGluIHByZWZlcmVuY2UgdG8KPiAgICB3cml0ZV9hdG9taWMoKQo+IAo+IE5vIGV4cGVjdGVk
IGNoYW5nZSBpbiBiZWhhdmlvdXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
