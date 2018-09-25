From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 2/5] x86/PoD: Avoid using variable length
 arrays in p2m_pod_zero_check()
Date: Tue, 25 Sep 2018 11:20:35 +0100
Message-ID: <c5cc870b-2f16-2ff2-5782-3487f79f8bb9@citrix.com>
References: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
 <1537794003-30851-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1537794003-30851-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMjQvMjAxOCAwMjowMCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDYWxsZXJzIG9m
IHAybV9wb2RfemVyb19jaGVjaygpIHBhc3MgYSBjb3VudCBvZiB1cCB0byBQT0RfU1dFRVBfU1RS
SURFLgo+IE1vdmUgdGhlIGRlZmluaXRpb24gb2YgUE9EX1NXRUVQX1NUUklERSBhbmQgZ2l2ZSB0
aGUgYXJyYXlzIGEgZml4ZWQKPiBib3VuZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
