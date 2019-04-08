From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] common/gnttab: Process softirqs while
 dumping grant tables
Date: Mon, 8 Apr 2019 10:41:38 +0100
Message-ID: <20190408094138.GB1986@zion.uk.xensource.com>
References: <1554481990-7569-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1554481990-7569-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMDUsIDIwMTkgYXQgMDU6MzM6MTBQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPU1NUZXN0cyB1cGdyYWRlIHRvIEplc3NpZSBoYXMgaWRlbnRpZmllZCB0aGF0IHdp
dGggYSBzdWZmaWNpZW50bHkgbGFyZ2UgZ3JhbnQKCkkgdGhpbmsgeW91IG1lYW50ICJ1cGdyYWRl
IHRvIFN0cmV0Y2giIGhlcmUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
