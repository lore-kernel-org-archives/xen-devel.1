From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/2] x86: Switch "struct desc_struct" to
 being seg_desc_t
Date: Fri, 7 Dec 2018 10:16:30 +0000
Message-ID: <20181207101630.fyzqk6qkltwkaftm@zion.uk.xensource.com>
References: <1544119435-15037-1-git-send-email-andrew.cooper3@citrix.com>
 <1544119435-15037-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1544119435-15037-2-git-send-email-andrew.cooper3@citrix.com>
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

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMDY6MDM6NTRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgc3RydWN0IHN1ZmZpeCBpcyByZWR1bmRhbnQgaW4gdGhlIG5hbWUsIGFuZCBh
IGZ1dHVyZSBjaGFuZ2Ugd2lsbCB3YW50IHRvCj4gdHVybiBpdCBpbnRvIGEgdW5pb24sIHJhdGhl
ciB0aGFuIGEgc3RydWN0dXJlLiAgQXMgdGhpcyByZXByZXNlbnRzIGEgc2VnbWVudAo+IGRlc2Ny
aXB0b3IsIGdpdmUgaXQgYW4gYXBwcm9wcmlhdGUgdHlwZWRlZi4KPiAKPiBObyBmdW5jdGlvbmFs
IGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
