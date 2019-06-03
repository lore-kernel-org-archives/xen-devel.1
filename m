From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 2/5] xen/vm-event: Expand vm_event_*
 spinlock macros and rename the lock
Date: Mon, 3 Jun 2019 17:02:51 +0300
Message-ID: <b36620b6-1936-0de9-9785-27808bfaf53e@bitdefender.com>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
 <1559564728-17167-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGpH=UC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hXnYB-0005Wj-G0
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:02:59 +0000
In-Reply-To: <1559564728-17167-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gNi8zLzE5IDM6MjUgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhlc2Ugc2VydmUgbm8g
cHVycG9zZSwgYnV0IHRvIGFkZCB0byB0aGUgY29uZ25pdGl2ZSBsb2FkIG9mIGZvbGxvd2luZwo+
IHRoZSBjb2RlLiAgUmVtb3ZlIHRoZSBsZXZlbCBvZiBpbmRpcmVjdGlvbi4KPiAKPiBGdXJ0aGVy
bW9yZSwgdGhlIGxvY2sgcHJvdGVjdHMgYWxsIGRhdGEgaW4gdm1fZXZlbnRfZG9tYWluLCBtYWtp
bmcKPiByaW5nX2xvY2sgYSBwb29yIGNob2ljZSBvZiBuYW1lLgo+IAo+IEZvciB2bV9ldmVudF9n
ZXRfcmVzcG9uc2UoKSBhbmQgdm1fZXZlbnRfZ3JhYl9zbG90KCksIGZvbGQgdGhlIGV4aXQKPiBw
YXRocyB0byBoYXZlIGEgc2luZ2xlIHVubG9jaywgYXMgdGhlIGNvbXBpbGVyIGNhbid0IG1ha2Ug
dGhpcwo+IG9wdGltaXNhdGlvbiBpdHNlbGYuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+
CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
