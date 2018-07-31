From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v14 01/11] x86/cpu: Introduce
 vmce_save_vcpu_ctxt_one() func
Date: Tue, 31 Jul 2018 06:06:09 -0600
Message-ID: <5B6050B102000078001D96E4@prv1-mh.provo.novell.com>
References: <1532520862-13648-1-git-send-email-aisaila@bitdefender.com>
 <1532520862-13648-2-git-send-email-aisaila@bitdefender.com>
 <5B604E5E02000078001D96A9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B604E5E02000078001D96A9@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA3LjE4IGF0IDEzOjU2LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDI1LjA3LjE4IGF0IDE0OjE0LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+
PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L21jaGVjay92bWNlLmMKPj4gKysrIGIveGVuL2FyY2gv
eDg2L2NwdS9tY2hlY2svdm1jZS5jCj4+IEBAIC0zNDksNiArMzQ5LDE4IEBAIGludCB2bWNlX3dy
bXNyKHVpbnQzMl90IG1zciwgdWludDY0X3QgdmFsKQo+PiAgICAgIHJldHVybiByZXQ7Cj4+ICB9
Cj4+ICAKPj4gK3N0YXRpYyBpbnQgdm1jZV9zYXZlX3ZjcHVfY3R4dF9vbmUoc3RydWN0IHZjcHUg
KnYsIGh2bV9kb21haW5fY29udGV4dF90ICpoKQo+IAo+IEFmYWljdCB2IGNhbiBiZSBwb2ludGVy
IHRvIGNvbnN0LgoKSG1tLCBJIGd1ZXNzIHJhdGhlciBub3QsIG9yIGVsc2UgeW91J2QgaGF2ZSB0
byB1bmRvIHRoYXQgaW4KcGF0Y2ggOCBvciA5IG9yIHNvLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
