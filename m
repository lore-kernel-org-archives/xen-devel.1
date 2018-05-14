From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 06/10] x86/spec_ctrl: Split
 X86_FEATURE_SC_MSR into PV and HVM variants
Date: Mon, 14 May 2018 16:22:40 +0100
Message-ID: <20180514152240.nreeq4igx5ttd4oo@citrix.com>
References: <1526035094-14343-1-git-send-email-andrew.cooper3@citrix.com>
 <1526035094-14343-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1526035094-14343-7-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMTEsIDIwMTggYXQgMTE6Mzg6MTBBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBJbiBvcmRlciB0byBzZXBhcmF0ZWx5IGNvbnRyb2wgd2hldGhlciBNU1JfU1BFQ19D
VFJMIGlzIHZpcnR1YWxpc2VkIGZvciBQViBhbmQKPiBIVk0gZ3Vlc3RzLCBzcGxpdCB0aGUgZmVh
dHVyZSB1c2VkIHRvIGNvbnRyb2wgcnVudGltZSBhbHRlcm5hdGl2ZXMgaW50byB0d28uCj4gWGVu
IHdpbGwgdXNlIE1TUl9TUEVDX0NUUkwgaXRzZWxmIGlmIGVpdGhlciBvZiB0aGVzZSBmZWF0dXJl
cyBhcmUgYWN0aXZlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
