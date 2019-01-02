From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/build-id: Fix xen_build_id_check() to
 be robust against malformed notes
Date: Wed, 2 Jan 2019 11:38:31 +0100
Message-ID: <20190102103831.xfg6wsomddqvy6e2@mac>
References: <1546277665-32720-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1546277665-32720-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMzEsIDIwMTggYXQgMDU6MzQ6MjVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBBIE5UX0dOVV9CVUlMRF9JRCB3aXRoIG5hbWVzeiBsb25nZXIgdGhhbiA0IHdpbGwg
Y2F1c2UgdGhlIHN0cm5jbXAoKSB0byB1c2UKPiBieXRlcyBpbiBhZGphY2VudCBzdHJpbmd0YWJs
ZSBlbnRyaWVzLgo+IAo+IEluc3RlYWQsIGNoZWNrIGZvciBuYW1lc3ogZXhhY3RseSBlcXVhbCB0
byA0LCBhbmQgdXNlIG1lbWNtcCgpIHdpdGggYW4KPiBleHBsaWNpdCBzaXplLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGlz
IExHVE06CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+CgpBbGJlaXQgSSB3b25kZXIgdGhlIHVzZWZ1bG5lc3Mgb2Ygc29tZSBvZiB0aGUgY2hlY2tz
IHBlcmZvcm1lZCBieSB0aGlzCmZ1bmN0aW9uLgoKSSdtIG5vdCBzdXJlIHRoZSBwb2ludCBvZiB0
aGUgJ24tPm5hbWVzeiArIG4tPmRlc2NzeiA8IG4tPm5hbWVzeicKY2hlY2ssIEkgYXNzdW1lIHRo
aXMgaXMgYW4gb3ZlcmZsb3cgY2hlY2suIEFuZCB0aGVuICduLT5uYW1lc3ogKwpuLT5kZXNjc3og
PiBuX3N6IC0gc2l6ZW9mKCpuKScgc2hvdWxkIHJhdGhlciBiZSAnbi0+bmFtZXN6ICsgbi0+ZGVz
Y3N6CiE9IG5fc3ogLSBzaXplb2YoKm4pJyBJIHRoaW5rLgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
