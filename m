From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v3 1/3] docs/features/qemu-deprivilege.pandoc:
 No support with Linux <2.6.18
Date: Mon, 14 Jan 2019 14:59:35 +0000
Message-ID: <20190114145937.16682-1-ian.jackson@eu.citrix.com>
References: <23608.54527.696432.275991@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3TbD=PW=citrix.com=prvs=910b85111=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gj3iP-00079n-Ex
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 14:59:49 +0000
In-Reply-To: <23608.54527.696432.275991@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U29tZSBlYXJseSBrZXJuZXNsIGFyZSBrbm93biBub3QgdG8gcmVqZWN0IHVua25vd24gZmxhZ3Mg
dG8KdW5zaGFyZSgpLiAgVGhlcmUgbWF5IGJlIG90aGVyIHByb2JsZW1zLgoKQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQp2MzogTmV3IGluIHRoaXMgdmVyc2lvbiBvZiB0aGUg
c2VyaWVzLgotLS0KIGRvY3MvZmVhdHVyZXMvcWVtdS1kZXByaXZpbGVnZS5wYW5kb2MgfCAzICsr
KwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RvY3MvZmVh
dHVyZXMvcWVtdS1kZXByaXZpbGVnZS5wYW5kb2MgYi9kb2NzL2ZlYXR1cmVzL3FlbXUtZGVwcml2
aWxlZ2UucGFuZG9jCmluZGV4IGViMDU5ODFhODMuLjIwZDZhYzIxODkgMTAwNjQ0Ci0tLSBhL2Rv
Y3MvZmVhdHVyZXMvcWVtdS1kZXByaXZpbGVnZS5wYW5kb2MKKysrIGIvZG9jcy9mZWF0dXJlcy9x
ZW11LWRlcHJpdmlsZWdlLnBhbmRvYwpAQCAtMTEyLDYgKzExMiw5IEBAIFRoZSBmb2xsb3dpbmcg
ZmVhdHVyZXMgc3RpbGwgbmVlZCB0byBiZSBpbXBsZW1lbnRlZDoKICAqIEluc2VydGluZyBhIG5l
dyBjZHJvbSB3aGlsZSB0aGUgZ3Vlc3QgaXMgcnVubmluZyAoeGwgY2Ryb20taW5zZXJ0KQogICog
TWlncmF0aW9uIC8gc2F2ZSAvIHJlc3RvcmUKIAorZG1fcmVzdHJpY3QgaXMgdG90YWxseSB1bnN1
cHBvcnRlZCBhbmQgbWF5IGhhdmUgdW5leHBlY3RlZCBzZWN1cml0eQorcHJvYmxlbXMgaWYgdXNl
ZCB3aXRoIGEgZG9tMCBMaW51eCBrZXJuZWwgZWFybGllciB0aGFuIDIuNi4xOC4KKwogQWRkaXRp
b25hbGx5LCBnZXR0aW5nIFBDSSBwYXNzdGhyb3VnaCB0byB3b3JrIHNlY3VyZWx5IHdvdWxkIHJl
cXVpcmUgYQogc2lnbmlmaWNhbnQgcmV3b3JrIG9mIGhvdyBwYXNzdGhyb3VnaCB3b3JrcyBhdCB0
aGUgbW9tZW50LiAgSXQgbWF5IGJlCiBpbXBsZW1lbnRlZCBhdCBzb21lIHBvaW50IGJ1dCBpcyBu
b3QgYSBuZWFyLXRlcm0gcHJpb3JpdHkuCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
