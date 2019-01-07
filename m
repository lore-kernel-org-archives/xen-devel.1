From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/build-id: Fix xen_build_id_check() to
 be robust against malformed notes
Date: Mon, 07 Jan 2019 03:33:57 -0700
Message-ID: <5C332B15020000780020AC51@prv1-mh.provo.novell.com>
References: <1546277665-32720-1-git-send-email-andrew.cooper3@citrix.com>
 <20190102104314.s4ioafq66wfvjrmx@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190102104314.s4ioafq66wfvjrmx@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAxLjE5IGF0IDExOjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBEZWMgMzEsIDIwMTggYXQgMDU6MzQ6MjVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gICAgICAvKiBTYW5pdHkgY2hlY2ssIG5hbWUgc2hvdWxkIGJlICJHTlUiIGZvciBs
ZC1nZW5lcmF0ZWQgYnVpbGQtaWQuICovCj4+IC0gICAgaWYgKCBzdHJuY21wKEVMRk5PVEVfTkFN
RShuKSwgIkdOVSIsIG4tPm5hbWVzeikgIT0gMCApCj4+ICsgICAgaWYgKCBtZW1jbXAoRUxGTk9U
RV9OQU1FKG4pLCAiR05VIiwgNCkgIT0gMCApCj4gCj4gT09JIHdoYXQgaXMgdGhlIGFkdmFudGFn
ZSBvZiBtZW1jbXAgY29tcGFyZWQgdG8gc3RybmNtcD8KCm1lbWNtcCgpIGdlbmVyYWxseSBpcyBt
b3JlIHBlcmZvcm1hbnQgdGhhbiBzdHJuY21wKCksIGR1ZSB0byBpdCBub3QKbmVlZGluZyB0byBs
b29rIGZvciBudWwgdGVybWluYXRvcnMuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
