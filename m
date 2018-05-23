From: Huaisheng Ye <yehs2007@163.com>
Subject: [RFC PATCH v3 4/9] fs/btrfs/extent_io: update usage of
 zone modifiers
Date: Wed, 23 May 2018 22:57:49 +0800
Message-ID: <1527087474-93986-5-git-send-email-yehs2007__13474.9131546871$1527093027$gmane$org@163.com>
References: <1527087474-93986-1-git-send-email-yehs2007@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sepi=ik=163.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fLWgL-0004KG-EL
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:32:09 +0000
In-Reply-To: <1527087474-93986-1-git-send-email-yehs2007@163.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, linux-mm@kvack.org
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, Josef Bacik <jbacik@fb.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, willy@infradead.org, colyli@suse.de, Christoph Hellwig <hch@infradead.org>, Chris Mason <clm@fb.com>, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, David Sterba <dsterba@suse.com>, xen-devel@lists.xenproject.org, mgorman@techsingularity.net, hch@lst.de, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKVXNlIF9fR0ZQX1pPTkVfTUFT
SyB0byByZXBsYWNlIChfX0dGUF9ETUEzMiB8IF9fR0ZQX0hJR0hNRU0pLgoKSW4gZnVuY3Rpb24g
YWxsb2NfZXh0ZW50X3N0YXRlLCBpdCBpcyBvYnZpb3VzIHRoYXQgX19HRlBfRE1BIGlzIG5vdAp0
aGUgZXhwZWN0aW5nIHpvbmUgdHlwZS4KCl9fX0dGUF9ETUEsIF9fX0dGUF9ISUdITUVNIGFuZCBf
X19HRlBfRE1BMzIgaGF2ZSBiZWVuIGRlbGV0ZWQgZnJvbSBHRlAKYml0bWFza3MsIHRoZSBib3R0
b20gdGhyZWUgYml0cyBvZiBHRlAgbWFzayBpcyByZXNlcnZlZCBmb3Igc3RvcmluZwplbmNvZGVk
IHpvbmUgbnVtYmVyLgpfX0dGUF9ETUEsIF9fR0ZQX0hJR0hNRU0gYW5kIF9fR0ZQX0RNQTMyIHNo
b3VsZCBub3QgYmUgb3BlcmF0ZWQgd2l0aAplYWNoIG90aGVycyBieSBPUi4KClVzZSBHRlBfTk9S
TUFMKCkgdG8gY2xlYXIgYm90dG9tIDMgYml0cyBvZiBHRlAgYml0bWFrcy4KClNpZ25lZC1vZmYt
Ynk6IEh1YWlzaGVuZyBZZSA8eWVoczFAbGVub3ZvLmNvbT4KQ2M6IENocmlzIE1hc29uIDxjbG1A
ZmIuY29tPgpDYzogSm9zZWYgQmFjaWsgPGpiYWNpa0BmYi5jb20+CkNjOiBEYXZpZCBTdGVyYmEg
PGRzdGVyYmFAc3VzZS5jb20+CkNjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5v
cmc+Ci0tLQogZnMvYnRyZnMvZXh0ZW50X2lvLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9idHJmcy9leHRlbnRf
aW8uYyBiL2ZzL2J0cmZzL2V4dGVudF9pby5jCmluZGV4IGU5OWIzMjkuLmY0MWZjNjEgMTAwNjQ0
Ci0tLSBhL2ZzL2J0cmZzL2V4dGVudF9pby5jCisrKyBiL2ZzL2J0cmZzL2V4dGVudF9pby5jCkBA
IC0yMjAsNyArMjIwLDcgQEAgc3RhdGljIHN0cnVjdCBleHRlbnRfc3RhdGUgKmFsbG9jX2V4dGVu
dF9zdGF0ZShnZnBfdCBtYXNrKQogCSAqIFRoZSBnaXZlbiBtYXNrIG1pZ2h0IGJlIG5vdCBhcHBy
b3ByaWF0ZSBmb3IgdGhlIHNsYWIgYWxsb2NhdG9yLAogCSAqIGRyb3AgdGhlIHVuc3VwcG9ydGVk
IGJpdHMKIAkgKi8KLQltYXNrICY9IH4oX19HRlBfRE1BMzJ8X19HRlBfSElHSE1FTSk7CisJbWFz
ayA9IEdGUF9OT1JNQUwobWFzayk7CiAJc3RhdGUgPSBrbWVtX2NhY2hlX2FsbG9jKGV4dGVudF9z
dGF0ZV9jYWNoZSwgbWFzayk7CiAJaWYgKCFzdGF0ZSkKIAkJcmV0dXJuIHN0YXRlOwotLSAKMS44
LjMuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
