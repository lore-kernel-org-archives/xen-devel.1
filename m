From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 3/5] xen/x86: Use %*pb[l] instead of
 cpumask_scn{, list}printf()
Date: Thu, 25 Oct 2018 04:56:54 -0600
Message-ID: <5BD1A17602000078001F4999@prv1-mh.provo.novell.com>
References: <1540213082-616-1-git-send-email-andrew.cooper3@citrix.com>
 <1540213082-616-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1540213082-616-4-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjEwLjE4IGF0IDE0OjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyByZW1vdmVzIGFsbCB1c2Ugb2Yga2V5aGFuZGxlcl9zY3JhdGNoIGFzIGEgYm91
bmNlLWJ1ZmZlciBmb3IgdGhlIAo+IHJlbmRlcmVkCj4gc3RyaW5nLgo+IAo+IE5vIGZ1bmN0aW9u
YWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0K
PiB2MjoKPiAgKiBGaXggJXBkIHR5cG8KPiAgKiBVc2UgLT5iaXRzIGZvciBjcHVtYXNrcwoKU2Ft
ZSBoZXJlIGFzIGZvciBwYXRjaCAyLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
