From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/5] x86/PoD: Avoid using variable length
 arrays in p2m_pod_zero_check()
Date: Mon, 24 Sep 2018 14:17:39 +0100
Message-ID: <20180924131739.y6aipvwi6bk6zwhh@zion.uk.xensource.com>
References: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
 <1537794003-30851-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1537794003-30851-3-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMjQsIDIwMTggYXQgMDI6MDA6MDBQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBDYWxsZXJzIG9mIHAybV9wb2RfemVyb19jaGVjaygpIHBhc3MgYSBjb3VudCBvZiB1
cCB0byBQT0RfU1dFRVBfU1RSSURFLgo+IE1vdmUgdGhlIGRlZmluaXRpb24gb2YgUE9EX1NXRUVQ
X1NUUklERSBhbmQgZ2l2ZSB0aGUgYXJyYXlzIGEgZml4ZWQKPiBib3VuZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3
ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
