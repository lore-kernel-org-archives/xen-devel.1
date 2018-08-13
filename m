From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 06/11] x86/paravirt: introduce new config
 option PARAVIRT_XXL
Date: Mon, 13 Aug 2018 09:37:34 +0200
Message-ID: <20180813073739.26108-7-jgross@suse.com>
References: <20180813073739.26108-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q/fn=k4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fp7QC-0007KC-Ad
 for xen-devel@lists.xenproject.org; Mon, 13 Aug 2018 07:37:48 +0000
In-Reply-To: <20180813073739.26108-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, rusty@rustcorp.com.au, peterz@infradead.org, mingo@redhat.com, hpa@zytor.com, akataria@vmware.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

QSBsYXJnZSBhbW91bnQgb2YgcGFyYXZpcnQgb3BzIGlzIHVzZWQgYnkgWGVuIFBWIGd1ZXN0cyBv
bmx5LiBBZGQgYSBuZXcKY29uZmlnIG9wdGlvbiBQQVJBVklSVF9YWEwgd2hpY2ggaXMgc2VsZWN0
ZWQgYnkgWEVOX1BWLiBMYXRlciB3ZSBjYW4KcHV0IHRoZSBYZW4gUFYgb25seSBwYXJhdmlydCBv
cHMgdW5kZXIgdGhlIFBBUkFDVklSVF9YWEwgdW1icmVsbGEuCgpTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogYXJjaC94ODYvS2NvbmZpZyAgICAgfCAz
ICsrKwogYXJjaC94ODYveGVuL0tjb25maWcgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvS2NvbmZpZyBiL2FyY2gveDg2L0tjb25m
aWcKaW5kZXggODg3ZDNhN2JiNjQ2Li4zYzk2N2I4MDNjMjEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L0tjb25maWcKKysrIGIvYXJjaC94ODYvS2NvbmZpZwpAQCAtNzU0LDYgKzc1NCw5IEBAIGNvbmZp
ZyBQQVJBVklSVAogCSAgb3ZlciBmdWxsIHZpcnR1YWxpemF0aW9uLiAgSG93ZXZlciwgd2hlbiBy
dW4gd2l0aG91dCBhIGh5cGVydmlzb3IKIAkgIHRoZSBrZXJuZWwgaXMgdGhlb3JldGljYWxseSBz
bG93ZXIgYW5kIHNsaWdodGx5IGxhcmdlci4KIAorY29uZmlnIFBBUkFWSVJUX1hYTAorCWJvb2wK
KwogY29uZmlnIFBBUkFWSVJUX0RFQlVHCiAJYm9vbCAicGFyYXZpcnQtb3BzIGRlYnVnZ2luZyIK
IAlkZXBlbmRzIG9uIFBBUkFWSVJUICYmIERFQlVHX0tFUk5FTApkaWZmIC0tZ2l0IGEvYXJjaC94
ODYveGVuL0tjb25maWcgYi9hcmNoL3g4Ni94ZW4vS2NvbmZpZwppbmRleCBjMWY5OGYzMmM0NWYu
LmRkOTJkN2JkMzYxMyAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL0tjb25maWcKKysrIGIvYXJj
aC94ODYveGVuL0tjb25maWcKQEAgLTE4LDYgKzE4LDcgQEAgY29uZmlnIFhFTl9QVgogCWJvb2wg
IlhlbiBQViBndWVzdCBzdXBwb3J0IgogCWRlZmF1bHQgeQogCWRlcGVuZHMgb24gWEVOCisJc2Vs
ZWN0IFBBUkFWSVJUX1hYTAogCXNlbGVjdCBYRU5fSEFWRV9QVk1NVQogCXNlbGVjdCBYRU5fSEFW
RV9WUE1VCiAJaGVscAotLSAKMi4xMy43CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
